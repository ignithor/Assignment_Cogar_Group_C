;; Auto-generated. Do not edit!


(when (boundp 'assignments::victim_report)
  (if (not (find-package "ASSIGNMENTS"))
    (make-package "ASSIGNMENTS"))
  (shadow 'victim_report (find-package "ASSIGNMENTS")))
(unless (find-package "ASSIGNMENTS::VICTIM_REPORT")
  (make-package "ASSIGNMENTS::VICTIM_REPORT"))
(unless (find-package "ASSIGNMENTS::VICTIM_REPORTREQUEST")
  (make-package "ASSIGNMENTS::VICTIM_REPORTREQUEST"))
(unless (find-package "ASSIGNMENTS::VICTIM_REPORTRESPONSE")
  (make-package "ASSIGNMENTS::VICTIM_REPORTRESPONSE"))

(in-package "ROS")





(defclass assignments::victim_reportRequest
  :super ros::object
  :slots (_x _y _z _victim_status ))

(defmethod assignments::victim_reportRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:victim_status __victim_status) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _victim_status (string __victim_status))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:victim_status
   (&optional __victim_status)
   (if __victim_status (setq _victim_status __victim_status)) _victim_status)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; string _victim_status
    4 (length _victim_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _victim_status
       (write-long (length _victim_status) s) (princ _victim_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _victim_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _victim_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::victim_reportResponse
  :super ros::object
  :slots (_success _message ))

(defmethod assignments::victim_reportResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::victim_report
  :super ros::object
  :slots ())

(setf (get assignments::victim_report :md5sum-) "5842e2c98f4b10149f7dbf8a9ec4edf6")
(setf (get assignments::victim_report :datatype-) "assignments/victim_report")
(setf (get assignments::victim_report :request) assignments::victim_reportRequest)
(setf (get assignments::victim_report :response) assignments::victim_reportResponse)

(defmethod assignments::victim_reportRequest
  (:response () (instance assignments::victim_reportResponse :init)))

(setf (get assignments::victim_reportRequest :md5sum-) "5842e2c98f4b10149f7dbf8a9ec4edf6")
(setf (get assignments::victim_reportRequest :datatype-) "assignments/victim_reportRequest")
(setf (get assignments::victim_reportRequest :definition-)
      "# Request: The location of the detected victim (position in the environment).
float64 x
float64 y
float64 z
string victim_status  # E.g., \"conscious\", \"unconscious\", \"critical\", etc.

---
# Response: Confirmation if the report was successfully sent.
bool success
string message  # Additional message, if any.
")

(setf (get assignments::victim_reportResponse :md5sum-) "5842e2c98f4b10149f7dbf8a9ec4edf6")
(setf (get assignments::victim_reportResponse :datatype-) "assignments/victim_reportResponse")
(setf (get assignments::victim_reportResponse :definition-)
      "# Request: The location of the detected victim (position in the environment).
float64 x
float64 y
float64 z
string victim_status  # E.g., \"conscious\", \"unconscious\", \"critical\", etc.

---
# Response: Confirmation if the report was successfully sent.
bool success
string message  # Additional message, if any.
")



(provide :assignments/victim_report "5842e2c98f4b10149f7dbf8a9ec4edf6")


