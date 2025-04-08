; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude ResolveConflict-request.msg.html

(cl:defclass <ResolveConflict-request> (roslisp-msg-protocol:ros-message)
  ((user_command
    :reader user_command
    :initarg :user_command
    :type cl:string
    :initform "")
   (planned_action
    :reader planned_action
    :initarg :planned_action
    :type cl:string
    :initform ""))
)

(cl:defclass ResolveConflict-request (<ResolveConflict-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResolveConflict-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResolveConflict-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<ResolveConflict-request> is deprecated: use assignments-srv:ResolveConflict-request instead.")))

(cl:ensure-generic-function 'user_command-val :lambda-list '(m))
(cl:defmethod user_command-val ((m <ResolveConflict-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:user_command-val is deprecated.  Use assignments-srv:user_command instead.")
  (user_command m))

(cl:ensure-generic-function 'planned_action-val :lambda-list '(m))
(cl:defmethod planned_action-val ((m <ResolveConflict-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:planned_action-val is deprecated.  Use assignments-srv:planned_action instead.")
  (planned_action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResolveConflict-request>) ostream)
  "Serializes a message object of type '<ResolveConflict-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'user_command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'user_command))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'planned_action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'planned_action))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResolveConflict-request>) istream)
  "Deserializes a message object of type '<ResolveConflict-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'user_command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'user_command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planned_action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'planned_action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResolveConflict-request>)))
  "Returns string type for a service object of type '<ResolveConflict-request>"
  "assignments/ResolveConflictRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResolveConflict-request)))
  "Returns string type for a service object of type 'ResolveConflict-request"
  "assignments/ResolveConflictRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResolveConflict-request>)))
  "Returns md5sum for a message object of type '<ResolveConflict-request>"
  "46e09040b26dd91cb6b1cac06fbcae3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResolveConflict-request)))
  "Returns md5sum for a message object of type 'ResolveConflict-request"
  "46e09040b26dd91cb6b1cac06fbcae3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResolveConflict-request>)))
  "Returns full string definition for message of type '<ResolveConflict-request>"
  (cl:format cl:nil "# Request~%string user_command~%string planned_action~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResolveConflict-request)))
  "Returns full string definition for message of type 'ResolveConflict-request"
  (cl:format cl:nil "# Request~%string user_command~%string planned_action~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResolveConflict-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'user_command))
     4 (cl:length (cl:slot-value msg 'planned_action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResolveConflict-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResolveConflict-request
    (cl:cons ':user_command (user_command msg))
    (cl:cons ':planned_action (planned_action msg))
))
;//! \htmlinclude ResolveConflict-response.msg.html

(cl:defclass <ResolveConflict-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (action_taken
    :reader action_taken
    :initarg :action_taken
    :type cl:string
    :initform ""))
)

(cl:defclass ResolveConflict-response (<ResolveConflict-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResolveConflict-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResolveConflict-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<ResolveConflict-response> is deprecated: use assignments-srv:ResolveConflict-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ResolveConflict-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:success-val is deprecated.  Use assignments-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'action_taken-val :lambda-list '(m))
(cl:defmethod action_taken-val ((m <ResolveConflict-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:action_taken-val is deprecated.  Use assignments-srv:action_taken instead.")
  (action_taken m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResolveConflict-response>) ostream)
  "Serializes a message object of type '<ResolveConflict-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action_taken))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action_taken))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResolveConflict-response>) istream)
  "Deserializes a message object of type '<ResolveConflict-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_taken) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action_taken) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResolveConflict-response>)))
  "Returns string type for a service object of type '<ResolveConflict-response>"
  "assignments/ResolveConflictResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResolveConflict-response)))
  "Returns string type for a service object of type 'ResolveConflict-response"
  "assignments/ResolveConflictResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResolveConflict-response>)))
  "Returns md5sum for a message object of type '<ResolveConflict-response>"
  "46e09040b26dd91cb6b1cac06fbcae3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResolveConflict-response)))
  "Returns md5sum for a message object of type 'ResolveConflict-response"
  "46e09040b26dd91cb6b1cac06fbcae3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResolveConflict-response>)))
  "Returns full string definition for message of type '<ResolveConflict-response>"
  (cl:format cl:nil "# Response~%bool success~%string action_taken~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResolveConflict-response)))
  "Returns full string definition for message of type 'ResolveConflict-response"
  (cl:format cl:nil "# Response~%bool success~%string action_taken~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResolveConflict-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'action_taken))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResolveConflict-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResolveConflict-response
    (cl:cons ':success (success msg))
    (cl:cons ':action_taken (action_taken msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResolveConflict)))
  'ResolveConflict-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResolveConflict)))
  'ResolveConflict-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResolveConflict)))
  "Returns string type for a service object of type '<ResolveConflict>"
  "assignments/ResolveConflict")