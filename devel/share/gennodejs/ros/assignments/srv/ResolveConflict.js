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

class ResolveConflictRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user_command = null;
      this.planned_action = null;
    }
    else {
      if (initObj.hasOwnProperty('user_command')) {
        this.user_command = initObj.user_command
      }
      else {
        this.user_command = '';
      }
      if (initObj.hasOwnProperty('planned_action')) {
        this.planned_action = initObj.planned_action
      }
      else {
        this.planned_action = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResolveConflictRequest
    // Serialize message field [user_command]
    bufferOffset = _serializer.string(obj.user_command, buffer, bufferOffset);
    // Serialize message field [planned_action]
    bufferOffset = _serializer.string(obj.planned_action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResolveConflictRequest
    let len;
    let data = new ResolveConflictRequest(null);
    // Deserialize message field [user_command]
    data.user_command = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [planned_action]
    data.planned_action = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.user_command);
    length += _getByteLength(object.planned_action);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/ResolveConflictRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c8f9cb37e5eafaeb55b83c804bdfcc0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request
    string user_command
    string planned_action
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResolveConflictRequest(null);
    if (msg.user_command !== undefined) {
      resolved.user_command = msg.user_command;
    }
    else {
      resolved.user_command = ''
    }

    if (msg.planned_action !== undefined) {
      resolved.planned_action = msg.planned_action;
    }
    else {
      resolved.planned_action = ''
    }

    return resolved;
    }
};

class ResolveConflictResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.action_taken = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('action_taken')) {
        this.action_taken = initObj.action_taken
      }
      else {
        this.action_taken = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ResolveConflictResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [action_taken]
    bufferOffset = _serializer.string(obj.action_taken, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ResolveConflictResponse
    let len;
    let data = new ResolveConflictResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [action_taken]
    data.action_taken = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.action_taken);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/ResolveConflictResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7cb82da9de0c8ef9eaae41a43f71655';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response
    bool success
    string action_taken
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ResolveConflictResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.action_taken !== undefined) {
      resolved.action_taken = msg.action_taken;
    }
    else {
      resolved.action_taken = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ResolveConflictRequest,
  Response: ResolveConflictResponse,
  md5sum() { return '46e09040b26dd91cb6b1cac06fbcae3b'; },
  datatype() { return 'assignments/ResolveConflict'; }
};
