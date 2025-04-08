;; Auto-generated. Do not edit!


(when (boundp 'assignments::Notifications)
  (if (not (find-package "ASSIGNMENTS"))
    (make-package "ASSIGNMENTS"))
  (shadow 'Notifications (find-package "ASSIGNMENTS")))
(unless (find-package "ASSIGNMENTS::NOTIFICATIONS")
  (make-package "ASSIGNMENTS::NOTIFICATIONS"))
(unless (find-package "ASSIGNMENTS::NOTIFICATIONSREQUEST")
  (make-package "ASSIGNMENTS::NOTIFICATIONSREQUEST"))
(unless (find-package "ASSIGNMENTS::NOTIFICATIONSRESPONSE")
  (make-package "ASSIGNMENTS::NOTIFICATIONSRESPONSE"))

(in-package "ROS")





(defclass assignments::NotificationsRequest
  :super ros::object
  :slots (_plate_name _table_number ))

(defmethod assignments::NotificationsRequest
  (:init
   (&key
    ((:plate_name __plate_name) "")
    ((:table_number __table_number) "")
    )
   (send-super :init)
   (setq _plate_name (string __plate_name))
   (setq _table_number (string __table_number))
   self)
  (:plate_name
   (&optional __plate_name)
   (if __plate_name (setq _plate_name __plate_name)) _plate_name)
  (:table_number
   (&optional __table_number)
   (if __table_number (setq _table_number __table_number)) _table_number)
  (:serialization-length
   ()
   (+
    ;; string _plate_name
    4 (length _plate_name)
    ;; string _table_number
    4 (length _table_number)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _plate_name
       (write-long (length _plate_name) s) (princ _plate_name s)
     ;; string _table_number
       (write-long (length _table_number) s) (princ _table_number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _plate_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _plate_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _table_number
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _table_number (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::NotificationsResponse
  :super ros::object
  :slots (_success _message ))

(defmethod assignments::NotificationsResponse
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

(defclass assignments::Notifications
  :super ros::object
  :slots ())

(setf (get assignments::Notifications :md5sum-) "31471cbc5866c6110d0f43de5ac7621e")
(setf (get assignments::Notifications :datatype-) "assignments/Notifications")
(setf (get assignments::Notifications :request) assignments::NotificationsRequest)
(setf (get assignments::Notifications :response) assignments::NotificationsResponse)

(defmethod assignments::NotificationsRequest
  (:response () (instance assignments::NotificationsResponse :init)))

(setf (get assignments::NotificationsRequest :md5sum-) "31471cbc5866c6110d0f43de5ac7621e")
(setf (get assignments::NotificationsRequest :datatype-) "assignments/NotificationsRequest")
(setf (get assignments::NotificationsRequest :definition-)
      "# Request: The name of the plate that was incorrectly delivered, and the table information.
string plate_name
string table_number  # The table where the wrong plate was delivered.

---
# Response: Confirmation if the notification was successfully sent.
bool success
string message  # A message confirming the notification, e.g., \"Notification sent to staff.\"
")

(setf (get assignments::NotificationsResponse :md5sum-) "31471cbc5866c6110d0f43de5ac7621e")
(setf (get assignments::NotificationsResponse :datatype-) "assignments/NotificationsResponse")
(setf (get assignments::NotificationsResponse :definition-)
      "# Request: The name of the plate that was incorrectly delivered, and the table information.
string plate_name
string table_number  # The table where the wrong plate was delivered.

---
# Response: Confirmation if the notification was successfully sent.
bool success
string message  # A message confirming the notification, e.g., \"Notification sent to staff.\"
")



(provide :assignments/Notifications "31471cbc5866c6110d0f43de5ac7621e")


