(in-package :sdl3)

(cffi:defctype properties-id :uint32)

(defcenum property-type
  :invalid
  :pointer
  :string
  :number
  :float
  :boolean)
