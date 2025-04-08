; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude InterpreterCommand-request.msg.html

(cl:defclass <InterpreterCommand-request> (roslisp-msg-protocol:ros-message)
  ((user_command
    :reader user_command
    :initarg :user_command
    :type cl:string
    :initform "")
   (current_step
    :reader current_step
    :initarg :current_step
    :type cl:string
    :initform ""))
)

(cl:defclass InterpreterCommand-request (<InterpreterCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InterpreterCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InterpreterCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<InterpreterCommand-request> is deprecated: use assignments-srv:InterpreterCommand-request instead.")))

(cl:ensure-generic-function 'user_command-val :lambda-list '(m))
(cl:defmethod user_command-val ((m <InterpreterCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:user_command-val is deprecated.  Use assignments-srv:user_command instead.")
  (user_command m))

(cl:ensure-generic-function 'current_step-val :lambda-list '(m))
(cl:defmethod current_step-val ((m <InterpreterCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:current_step-val is deprecated.  Use assignments-srv:current_step instead.")
  (current_step m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InterpreterCommand-request>) ostream)
  "Serializes a message object of type '<InterpreterCommand-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'user_command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'user_command))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'current_step))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'current_step))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InterpreterCommand-request>) istream)
  "Deserializes a message object of type '<InterpreterCommand-request>"
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
      (cl:setf (cl:slot-value msg 'current_step) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'current_step) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InterpreterCommand-request>)))
  "Returns string type for a service object of type '<InterpreterCommand-request>"
  "assignments/InterpreterCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InterpreterCommand-request)))
  "Returns string type for a service object of type 'InterpreterCommand-request"
  "assignments/InterpreterCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InterpreterCommand-request>)))
  "Returns md5sum for a message object of type '<InterpreterCommand-request>"
  "233406fee41744d870c89e8f3e025de8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InterpreterCommand-request)))
  "Returns md5sum for a message object of type 'InterpreterCommand-request"
  "233406fee41744d870c89e8f3e025de8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InterpreterCommand-request>)))
  "Returns full string definition for message of type '<InterpreterCommand-request>"
  (cl:format cl:nil "# Request~%string user_command~%string current_step~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InterpreterCommand-request)))
  "Returns full string definition for message of type 'InterpreterCommand-request"
  (cl:format cl:nil "# Request~%string user_command~%string current_step~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InterpreterCommand-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'user_command))
     4 (cl:length (cl:slot-value msg 'current_step))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InterpreterCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InterpreterCommand-request
    (cl:cons ':user_command (user_command msg))
    (cl:cons ':current_step (current_step msg))
))
;//! \htmlinclude InterpreterCommand-response.msg.html

(cl:defclass <InterpreterCommand-response> (roslisp-msg-protocol:ros-message)
  ((valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil)
   (interpreted_action
    :reader interpreted_action
    :initarg :interpreted_action
    :type cl:string
    :initform ""))
)

(cl:defclass InterpreterCommand-response (<InterpreterCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InterpreterCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InterpreterCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<InterpreterCommand-response> is deprecated: use assignments-srv:InterpreterCommand-response instead.")))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <InterpreterCommand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:valid-val is deprecated.  Use assignments-srv:valid instead.")
  (valid m))

(cl:ensure-generic-function 'interpreted_action-val :lambda-list '(m))
(cl:defmethod interpreted_action-val ((m <InterpreterCommand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:interpreted_action-val is deprecated.  Use assignments-srv:interpreted_action instead.")
  (interpreted_action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InterpreterCommand-response>) ostream)
  "Serializes a message object of type '<InterpreterCommand-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'interpreted_action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'interpreted_action))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InterpreterCommand-response>) istream)
  "Deserializes a message object of type '<InterpreterCommand-response>"
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'interpreted_action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'interpreted_action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InterpreterCommand-response>)))
  "Returns string type for a service object of type '<InterpreterCommand-response>"
  "assignments/InterpreterCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InterpreterCommand-response)))
  "Returns string type for a service object of type 'InterpreterCommand-response"
  "assignments/InterpreterCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InterpreterCommand-response>)))
  "Returns md5sum for a message object of type '<InterpreterCommand-response>"
  "233406fee41744d870c89e8f3e025de8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InterpreterCommand-response)))
  "Returns md5sum for a message object of type 'InterpreterCommand-response"
  "233406fee41744d870c89e8f3e025de8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InterpreterCommand-response>)))
  "Returns full string definition for message of type '<InterpreterCommand-response>"
  (cl:format cl:nil "# Response~%bool valid~%string interpreted_action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InterpreterCommand-response)))
  "Returns full string definition for message of type 'InterpreterCommand-response"
  (cl:format cl:nil "# Response~%bool valid~%string interpreted_action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InterpreterCommand-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'interpreted_action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InterpreterCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InterpreterCommand-response
    (cl:cons ':valid (valid msg))
    (cl:cons ':interpreted_action (interpreted_action msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InterpreterCommand)))
  'InterpreterCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InterpreterCommand)))
  'InterpreterCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InterpreterCommand)))
  "Returns string type for a service object of type '<InterpreterCommand>"
  "assignments/InterpreterCommand")