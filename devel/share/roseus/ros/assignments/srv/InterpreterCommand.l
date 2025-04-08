;; Auto-generated. Do not edit!


(when (boundp 'assignments::InterpreterCommand)
  (if (not (find-package "ASSIGNMENTS"))
    (make-package "ASSIGNMENTS"))
  (shadow 'InterpreterCommand (find-package "ASSIGNMENTS")))
(unless (find-package "ASSIGNMENTS::INTERPRETERCOMMAND")
  (make-package "ASSIGNMENTS::INTERPRETERCOMMAND"))
(unless (find-package "ASSIGNMENTS::INTERPRETERCOMMANDREQUEST")
  (make-package "ASSIGNMENTS::INTERPRETERCOMMANDREQUEST"))
(unless (find-package "ASSIGNMENTS::INTERPRETERCOMMANDRESPONSE")
  (make-package "ASSIGNMENTS::INTERPRETERCOMMANDRESPONSE"))

(in-package "ROS")





(defclass assignments::InterpreterCommandRequest
  :super ros::object
  :slots (_user_command _current_step ))

(defmethod assignments::InterpreterCommandRequest
  (:init
   (&key
    ((:user_command __user_command) "")
    ((:current_step __current_step) "")
    )
   (send-super :init)
   (setq _user_command (string __user_command))
   (setq _current_step (string __current_step))
   self)
  (:user_command
   (&optional __user_command)
   (if __user_command (setq _user_command __user_command)) _user_command)
  (:current_step
   (&optional __current_step)
   (if __current_step (setq _current_step __current_step)) _current_step)
  (:serialization-length
   ()
   (+
    ;; string _user_command
    4 (length _user_command)
    ;; string _current_step
    4 (length _current_step)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _user_command
       (write-long (length _user_command) s) (princ _user_command s)
     ;; string _current_step
       (write-long (length _current_step) s) (princ _current_step s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _user_command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _user_command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _current_step
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _current_step (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::InterpreterCommandResponse
  :super ros::object
  :slots (_valid _interpreted_action ))

(defmethod assignments::InterpreterCommandResponse
  (:init
   (&key
    ((:valid __valid) nil)
    ((:interpreted_action __interpreted_action) "")
    )
   (send-super :init)
   (setq _valid __valid)
   (setq _interpreted_action (string __interpreted_action))
   self)
  (:valid
   (&optional (__valid :null))
   (if (not (eq __valid :null)) (setq _valid __valid)) _valid)
  (:interpreted_action
   (&optional __interpreted_action)
   (if __interpreted_action (setq _interpreted_action __interpreted_action)) _interpreted_action)
  (:serialization-length
   ()
   (+
    ;; bool _valid
    1
    ;; string _interpreted_action
    4 (length _interpreted_action)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;; string _interpreted_action
       (write-long (length _interpreted_action) s) (princ _interpreted_action s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _interpreted_action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _interpreted_action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass assignments::InterpreterCommand
  :super ros::object
  :slots ())

(setf (get assignments::InterpreterCommand :md5sum-) "233406fee41744d870c89e8f3e025de8")
(setf (get assignments::InterpreterCommand :datatype-) "assignments/InterpreterCommand")
(setf (get assignments::InterpreterCommand :request) assignments::InterpreterCommandRequest)
(setf (get assignments::InterpreterCommand :response) assignments::InterpreterCommandResponse)

(defmethod assignments::InterpreterCommandRequest
  (:response () (instance assignments::InterpreterCommandResponse :init)))

(setf (get assignments::InterpreterCommandRequest :md5sum-) "233406fee41744d870c89e8f3e025de8")
(setf (get assignments::InterpreterCommandRequest :datatype-) "assignments/InterpreterCommandRequest")
(setf (get assignments::InterpreterCommandRequest :definition-)
      "# Request
string user_command
string current_step

---
# Response
bool valid
string interpreted_action
")

(setf (get assignments::InterpreterCommandResponse :md5sum-) "233406fee41744d870c89e8f3e025de8")
(setf (get assignments::InterpreterCommandResponse :datatype-) "assignments/InterpreterCommandResponse")
(setf (get assignments::InterpreterCommandResponse :definition-)
      "# Request
string user_command
string current_step

---
# Response
bool valid
string interpreted_action
")



(provide :assignments/InterpreterCommand "233406fee41744d870c89e8f3e025de8")


