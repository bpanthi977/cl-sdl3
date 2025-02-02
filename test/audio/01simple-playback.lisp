(in-package :sdl3.demo.audio)

(defparameter *window-handle* nil)
(defparameter *renderer-handler* nil)
(defparameter *audio-stream* nil)
(defparameter *current-sine-stream* 0)

(sdl3:def-app-init simple-playback-init (argc argv)
  (declare (ignore argc argv))
  (sdl3:set-app-metadata "Example Audio Simple Playback" "1.0" "com.example.audio-simple-playback")
  (when (not (sdl3:init '(:video :audio)))
    (format t "~a~%" (sdl3:get-error))
    (return-from simple-playback-init :failure))
  (multiple-value-bind (rst window renderer)
      (sdl3:create-window-and-renderer "examples/audio/simple-playback" 900 900 :resizable)
    (if (not rst)
	(progn 
	  (format t "~a~%" (sdl3:get-error))
	  (return-from simple-playback-init :failure))
	(setf *window-handle* window
	      *renderer-handler* renderer)))
  (let ((spec (make-instance 'sdl3:audio-spec :%freq 8000
					      :%channels 1
					      :%format :f32le)))
    (setf *audio-stream* (sdl3:open-audio-device-stream spec))
    (when (cffi:null-pointer-p *audio-stream*)
      (format t "~a~%" (sdl3:get-error))
      (return-from simple-playback-init :failure))
    (sdl3:resume-audio-stream-device *audio-stream*))
  :continue)

(sdl3:def-app-iterate simple-playback-iterate ()
  (let ((min-audio (floor (/ (* 8000 (cffi:foreign-type-size :float)) 2))))
    (when (< (sdl3:get-audio-stream-available *audio-stream*) min-audio)
      (cffi:with-foreign-object (ptr :float 512)
	(dotimes (i 512)
	  (let* ((freq 400)
		 (phase (/ (* *current-sine-stream* freq) 8000.0))
		 (val (%u:to-single-float (sin (* 2 phase pi)))))
	    (setf (cffi:mem-aref ptr :float i) val)
	    (incf *current-sine-stream*)))
	(setf *current-sine-stream* (mod *current-sine-stream* 8000))
	(sdl3:put-audio-stream-data *audio-stream* ptr (* (cffi:foreign-type-size :float) 512))))
    (sdl3:set-render-draw-color *renderer-handler* 100 100 100 255)
    (sdl3:render-clear *renderer-handler*)
    (sdl3:render-present *renderer-handler*)
    :continue))

(sdl3:def-app-event simple-playback-event (event-type pevent)
  (when (eql event-type :quit)
    (return-from simple-playback-event :success))
  :continue)

(sdl3:def-app-quit simple-playback-quit (result)
  (declare (ignore result)))

(defun do-simple-playback-demo ()
  (sdl3:enter-app-main-callbacks 'simple-playback-init 'simple-playback-iterate 'simple-playback-event 'simple-playback-quit))

