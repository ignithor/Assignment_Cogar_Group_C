;; Auto-generated. Do not edit!


(when (boundp 'assignments::mission_status)
  (if (not (find-package "ASSIGNMENTS"))
    (make-package "ASSIGNMENTS"))
  (shadow 'mission_status (find-package "ASSIGNMENTS")))
(unless (find-package "ASSIGNMENTS::MISSION_STATUS")
  (make-package "ASSIGNMENTS::MISSION_STATUS"))
(unless (find-package "ASSIGNMENTS::MISSION_STATUSREQUEST")
  (make-package "ASSIGNMENTS::MISSION_STATUSREQUEST"))
(unless (find-package "ASSIGNMENTS::MISSION_STATUSRESPONSE")
  (make-package "ASSIGNMENTS::MISSION_STATUSRESPONSE"))

(in-package "ROS")





(defclass assignments::mission_statusRequest
  :super ros::object
  :slots (_mission_id _success ))

(defmethod assignments::mission_statusRequest
  (:init
   (&key
    ((:mission_id __mission_id) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _mission_id (string __mission_id))
   (setq _success __success)
   self)
  (:mission_id
   (&optional __mission_id)
   (if __mission_id (setq _mission_id __mission_id)) _mission_id)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _mission_id
    4 (length _mission_id)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mission_id
       (write-long (length _mission_id) s) (princ _mission_id s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mission_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mission_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass assignments::mission_statusResponse
  :super ros::object
  :slots (_mission_complete _message ))

(defmethod assignments::mission_statusResponse
  (:init
   (&key
    ((:mission_complete __mission_complete) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _mission_complete __mission_complete)
   (setq _message (string __message))
   self)
  (:mission_complete
   (&optional (__mission_complete :null))
   (if (not (eq __mission_complete :null)) (setq _mission_complete __mission_complete)) _mission_complete)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _mission_complete
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _mission_complete
       (if _mission_complete (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _mission_complete
     (setq _mission_complete (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::mission_status
  :super ros::object
  :slots ())

(setf (get assignments::mission_status :md5sum-) "8473414d924f983938aed34e90fbc692")
(setf (get assignments::mission_status :datatype-) "assignments/mission_status")
(setf (get assignments::mission_status :request) assignments::mission_statusRequest)
(setf (get assignments::mission_status :response) assignments::mission_statusResponse)

(defmethod assignments::mission_statusRequest
  (:response () (instance assignments::mission_statusResponse :init)))

(setf (get assignments::mission_statusRequest :md5sum-) "8473414d924f983938aed34e90fbc692")
(setf (get assignments::mission_statusRequest :datatype-) "assignments/mission_statusRequest")
(setf (get assignments::mission_statusRequest :definition-)
      "# Request: Information about the status of the mission.
string mission_id
bool success  # If the mission is successfully completed.

---
# Response: Confirmation of mission status.
bool mission_complete  # Whether the mission is completed successfully.
string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"
")

(setf (get assignments::mission_statusResponse :md5sum-) "8473414d924f983938aed34e90fbc692")
(setf (get assignments::mission_statusResponse :datatype-) "assignments/mission_statusResponse")
(setf (get assignments::mission_statusResponse :definition-)
      "# Request: Information about the status of the mission.
string mission_id
bool success  # If the mission is successfully completed.

---
# Response: Confirmation of mission status.
bool mission_complete  # Whether the mission is completed successfully.
string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"
")



(provide :assignments/mission_status "8473414d924f983938aed34e90fbc692")


