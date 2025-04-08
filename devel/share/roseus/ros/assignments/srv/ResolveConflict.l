;; Auto-generated. Do not edit!


(when (boundp 'assignments::ResolveConflict)
  (if (not (find-package "ASSIGNMENTS"))
    (make-package "ASSIGNMENTS"))
  (shadow 'ResolveConflict (find-package "ASSIGNMENTS")))
(unless (find-package "ASSIGNMENTS::RESOLVECONFLICT")
  (make-package "ASSIGNMENTS::RESOLVECONFLICT"))
(unless (find-package "ASSIGNMENTS::RESOLVECONFLICTREQUEST")
  (make-package "ASSIGNMENTS::RESOLVECONFLICTREQUEST"))
(unless (find-package "ASSIGNMENTS::RESOLVECONFLICTRESPONSE")
  (make-package "ASSIGNMENTS::RESOLVECONFLICTRESPONSE"))

(in-package "ROS")





(defclass assignments::ResolveConflictRequest
  :super ros::object
  :slots (_user_command _planned_action ))

(defmethod assignments::ResolveConflictRequest
  (:init
   (&key
    ((:user_command __user_command) "")
    ((:planned_action __planned_action) "")
    )
   (send-super :init)
   (setq _user_command (string __user_command))
   (setq _planned_action (string __planned_action))
   self)
  (:user_command
   (&optional __user_command)
   (if __user_command (setq _user_command __user_command)) _user_command)
  (:planned_action
   (&optional __planned_action)
   (if __planned_action (setq _planned_action __planned_action)) _planned_action)
  (:serialization-length
   ()
   (+
    ;; string _user_command
    4 (length _user_command)
    ;; string _planned_action
    4 (length _planned_action)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _user_command
       (write-long (length _user_command) s) (princ _user_command s)
     ;; string _planned_action
       (write-long (length _planned_action) s) (princ _planned_action s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _user_command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _user_command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _planned_action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _planned_action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::ResolveConflictResponse
  :super ros::object
  :slots (_success _action_taken ))

(defmethod assignments::ResolveConflictResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:action_taken __action_taken) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _action_taken (string __action_taken))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:action_taken
   (&optional __action_taken)
   (if __action_taken (setq _action_taken __action_taken)) _action_taken)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _action_taken
    4 (length _action_taken)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _action_taken
       (write-long (length _action_taken) s) (princ _action_taken s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _action_taken
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_taken (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::ResolveConflict
  :super ros::object
  :slots ())

(setf (get assignments::ResolveConflict :md5sum-) "46e09040b26dd91cb6b1cac06fbcae3b")
(setf (get assignments::ResolveConflict :datatype-) "assignments/ResolveConflict")
(setf (get assignments::ResolveConflict :request) assignments::ResolveConflictRequest)
(setf (get assignments::ResolveConflict :response) assignments::ResolveConflictResponse)

(defmethod assignments::ResolveConflictRequest
  (:response () (instance assignments::ResolveConflictResponse :init)))

(setf (get assignments::ResolveConflictRequest :md5sum-) "46e09040b26dd91cb6b1cac06fbcae3b")
(setf (get assignments::ResolveConflictRequest :datatype-) "assignments/ResolveConflictRequest")
(setf (get assignments::ResolveConflictRequest :definition-)
      "# Request
string user_command
string planned_action

---
# Response
bool success
string action_taken
")

(setf (get assignments::ResolveConflictResponse :md5sum-) "46e09040b26dd91cb6b1cac06fbcae3b")
(setf (get assignments::ResolveConflictResponse :datatype-) "assignments/ResolveConflictResponse")
(setf (get assignments::ResolveConflictResponse :definition-)
      "# Request
string user_command
string planned_action

---
# Response
bool success
string action_taken
")



(provide :assignments/ResolveConflict "46e09040b26dd91cb6b1cac06fbcae3b")


