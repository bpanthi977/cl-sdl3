(defsystem "sdl3"
  :version "0.0.1"
  :author "YJC"
  :license ""
  :depends-on (:alexandria
	       :cffi-libffi)
  :components ((:module "src"
		:components
		((:file "package")
		 (:file "util")
		 (:file "lib")
		 (:module "init"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "hints"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "error"
		  :components
		  ((:file "func")))
		 (:module "properties"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "log"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "rect"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "keyboard"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "mouse"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "touch"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "sensor"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "power"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "guid"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "gamepad"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "joystick"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "haptic"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "audio"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "time"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "timer"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "sharedobject"
		  :components
		  ((:file "func")))
		 (:module "thread"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "atomic"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "mutex"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "filesystem"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "iostream"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "asyncio"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "storage"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "pixels"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "blendmode"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "surface"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "camera"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "clipboard"
		  :components
		  ((:file "func")))
		 (:module "dialog"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "gpu"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "messagebox"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "vulkan"
		  :components
		  ((:file "func")))
		 (:module "metal"
		  :components
		  ((:file "func")))
		 (:module "process"
		  :components
		  ((:file "func")))
		 (:module "bits"
		  :components
		  ((:file "func")))
		 (:module "endian"
		  :components
		  ((:file "func")))
		 (:module "assert"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "cpuinfo"
		  :components
		  ((:file "func")))
		 (:module "intrinsics")
		 (:module "locale"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "system")
		 (:module "misc"
		  :components
		  ((:file "func")))
		 (:module "video"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "render"
		  :components
		  ((:file "type")
		   (:file "func")
		   (:file "wrap")))
		 (:module "events"
		  :components
		  ((:file "type")
		   (:file "func")))
		 (:module "main"
		  :components
		  ((:file "type")
		   (:file "func")
		   (:file "wrap")))
		 (:module "stdinc"))))
  :description "common lisp bind sdl3 use cffi")


(defsystem "sdl3/tests"
  :version "0.0.1"
  :author "YJC"
  :license ""
  :depends-on (:sdl3)
  :components ((:module "test"
		:components
		((:file "util")
		 (:module "rendertest"
		  :components
		  ((:file "package")
		   (:file "01clear"))))))
  :description "test function here")
