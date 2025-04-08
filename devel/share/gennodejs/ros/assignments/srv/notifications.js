// Auto-generated. Do not edit!

// (in-package assignments.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class notificationsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plate_name = null;
      this.table_number = null;
    }
    else {
      if (initObj.hasOwnProperty('plate_name')) {
        this.plate_name = initObj.plate_name
      }
      else {
        this.plate_name = '';
      }
      if (initObj.hasOwnProperty('table_number')) {
        this.table_number = initObj.table_number
      }
      else {
        this.table_number = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type notificationsRequest
    // Serialize message field [plate_name]
    bufferOffset = _serializer.string(obj.plate_name, buffer, bufferOffset);
    // Serialize message field [table_number]
    bufferOffset = _serializer.string(obj.table_number, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type notificationsRequest
    let len;
    let data = new notificationsRequest(null);
    // Deserialize message field [plate_name]
    data.plate_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [table_number]
    data.table_number = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.plate_name);
    length += _getByteLength(object.table_number);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/notificationsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c21072be71a7505b708c3fb22486d4d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request: The name of the plate that was incorrectly delivered, and the table information.
    string plate_name
    string table_number  # The table where the wrong plate was delivered.
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new notificationsRequest(null);
    if (msg.plate_name !== undefined) {
      resolved.plate_name = msg.plate_name;
    }
    else {
      resolved.plate_name = ''
    }

    if (msg.table_number !== undefined) {
      resolved.table_number = msg.table_number;
    }
    else {
      resolved.table_number = ''
    }

    return resolved;
    }
};

class notificationsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type notificationsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type notificationsResponse
    let len;
    let data = new notificationsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/notificationsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response: Confirmation if the notification was successfully sent.
    bool success
    string message  # A message confirming the notification, e.g., "Notification sent to staff."
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new notificationsResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: notificationsRequest,
  Response: notificationsResponse,
  md5sum() { return '31471cbc5866c6110d0f43de5ac7621e'; },
  datatype() { return 'assignments/notifications'; }
};
