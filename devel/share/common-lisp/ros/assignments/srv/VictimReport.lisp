; Auto-generated. Do not edit!


(cl:in-package assignments-srv)


;//! \htmlinclude VictimReport-request.msg.html

(cl:defclass <VictimReport-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (victim_status
    :reader victim_status
    :initarg :victim_status
    :type cl:string
    :initform ""))
)

(cl:defclass VictimReport-request (<VictimReport-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VictimReport-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VictimReport-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<VictimReport-request> is deprecated: use assignments-srv:VictimReport-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <VictimReport-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:x-val is deprecated.  Use assignments-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <VictimReport-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:y-val is deprecated.  Use assignments-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <VictimReport-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:z-val is deprecated.  Use assignments-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'victim_status-val :lambda-list '(m))
(cl:defmethod victim_status-val ((m <VictimReport-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:victim_status-val is deprecated.  Use assignments-srv:victim_status instead.")
  (victim_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VictimReport-request>) ostream)
  "Serializes a message object of type '<VictimReport-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'victim_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'victim_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VictimReport-request>) istream)
  "Deserializes a message object of type '<VictimReport-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'victim_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'victim_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VictimReport-request>)))
  "Returns string type for a service object of type '<VictimReport-request>"
  "assignments/VictimReportRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VictimReport-request)))
  "Returns string type for a service object of type 'VictimReport-request"
  "assignments/VictimReportRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VictimReport-request>)))
  "Returns md5sum for a message object of type '<VictimReport-request>"
  "5842e2c98f4b10149f7dbf8a9ec4edf6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VictimReport-request)))
  "Returns md5sum for a message object of type 'VictimReport-request"
  "5842e2c98f4b10149f7dbf8a9ec4edf6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VictimReport-request>)))
  "Returns full string definition for message of type '<VictimReport-request>"
  (cl:format cl:nil "# Request: The location of the detected victim (position in the environment).~%float64 x~%float64 y~%float64 z~%string victim_status  # E.g., \"conscious\", \"unconscious\", \"critical\", etc.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VictimReport-request)))
  "Returns full string definition for message of type 'VictimReport-request"
  (cl:format cl:nil "# Request: The location of the detected victim (position in the environment).~%float64 x~%float64 y~%float64 z~%string victim_status  # E.g., \"conscious\", \"unconscious\", \"critical\", etc.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VictimReport-request>))
  (cl:+ 0
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'victim_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VictimReport-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VictimReport-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':victim_status (victim_status msg))
))
;//! \htmlinclude VictimReport-response.msg.html

(cl:defclass <VictimReport-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass VictimReport-response (<VictimReport-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VictimReport-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VictimReport-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignments-srv:<VictimReport-response> is deprecated: use assignments-srv:VictimReport-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <VictimReport-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:success-val is deprecated.  Use assignments-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <VictimReport-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignments-srv:message-val is deprecated.  Use assignments-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VictimReport-response>) ostream)
  "Serializes a message object of type '<VictimReport-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VictimReport-response>) istream)
  "Deserializes a message object of type '<VictimReport-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VictimReport-response>)))
  "Returns string type for a service object of type '<VictimReport-response>"
  "assignments/VictimReportResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VictimReport-response)))
  "Returns string type for a service object of type 'VictimReport-response"
  "assignments/VictimReportResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VictimReport-response>)))
  "Returns md5sum for a message object of type '<VictimReport-response>"
  "5842e2c98f4b10149f7dbf8a9ec4edf6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VictimReport-response)))
  "Returns md5sum for a message object of type 'VictimReport-response"
  "5842e2c98f4b10149f7dbf8a9ec4edf6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VictimReport-response>)))
  "Returns full string definition for message of type '<VictimReport-response>"
  (cl:format cl:nil "# Response: Confirmation if the report was successfully sent.~%bool success~%string message  # Additional message, if any.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VictimReport-response)))
  "Returns full string definition for message of type 'VictimReport-response"
  (cl:format cl:nil "# Response: Confirmation if the report was successfully sent.~%bool success~%string message  # Additional message, if any.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VictimReport-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VictimReport-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VictimReport-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VictimReport)))
  'VictimReport-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VictimReport)))
  'VictimReport-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VictimReport)))
  "Returns string type for a service object of type '<VictimReport>"
  "assignments/VictimReport")