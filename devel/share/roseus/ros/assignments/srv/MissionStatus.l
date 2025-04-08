;; Auto-generated. Do not edit!


(when (boundp 'assignments::MissionStatus)
  (if (not (find-package "ASSIGNMENTS"))
    (make-package "ASSIGNMENTS"))
  (shadow 'MissionStatus (find-package "ASSIGNMENTS")))
(unless (find-package "ASSIGNMENTS::MISSIONSTATUS")
  (make-package "ASSIGNMENTS::MISSIONSTATUS"))
(unless (find-package "ASSIGNMENTS::MISSIONSTATUSREQUEST")
  (make-package "ASSIGNMENTS::MISSIONSTATUSREQUEST"))
(unless (find-package "ASSIGNMENTS::MISSIONSTATUSRESPONSE")
  (make-package "ASSIGNMENTS::MISSIONSTATUSRESPONSE"))

(in-package "ROS")





(defclass assignments::MissionStatusRequest
  :super ros::object
  :slots (_mission_id _success ))

(defmethod assignments::MissionStatusRequest
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

(defclass assignments::MissionStatusResponse
  :super ros::object
  :slots (_mission_complete _message ))

(defmethod assignments::MissionStatusResponse
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

(defclass assignments::MissionStatus
  :super ros::object
  :slots ())

(setf (get assignments::MissionStatus :md5sum-) "8473414d924f983938aed34e90fbc692")
(setf (get assignments::MissionStatus :datatype-) "assignments/MissionStatus")
(setf (get assignments::MissionStatus :request) assignments::MissionStatusRequest)
(setf (get assignments::MissionStatus :response) assignments::MissionStatusResponse)

(defmethod assignments::MissionStatusRequest
  (:response () (instance assignments::MissionStatusResponse :init)))

(setf (get assignments::MissionStatusRequest :md5sum-) "8473414d924f983938aed34e90fbc692")
(setf (get assignments::MissionStatusRequest :datatype-) "assignments/MissionStatusRequest")
(setf (get assignments::MissionStatusRequest :definition-)
      "# Request: Information about the status of the mission.
string mission_id
bool success  # If the mission is successfully completed.

---
# Response: Confirmation of mission status.
bool mission_complete  # Whether the mission is completed successfully.
string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"
")

(setf (get assignments::MissionStatusResponse :md5sum-) "8473414d924f983938aed34e90fbc692")
(setf (get assignments::MissionStatusResponse :datatype-) "assignments/MissionStatusResponse")
(setf (get assignments::MissionStatusResponse :definition-)
      "# Request: Information about the status of the mission.
string mission_id
bool success  # If the mission is successfully completed.

---
# Response: Confirmation of mission status.
bool mission_complete  # Whether the mission is completed successfully.
string message  # Additional message about the mission, e.g., \"Mission completed successfully.\"
")



(provide :assignments/MissionStatus "8473414d924f983938aed34e90fbc692")


