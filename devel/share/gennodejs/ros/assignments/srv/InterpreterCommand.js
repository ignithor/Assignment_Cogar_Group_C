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

class InterpreterCommandRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user_command = null;
      this.current_step = null;
    }
    else {
      if (initObj.hasOwnProperty('user_command')) {
        this.user_command = initObj.user_command
      }
      else {
        this.user_command = '';
      }
      if (initObj.hasOwnProperty('current_step')) {
        this.current_step = initObj.current_step
      }
      else {
        this.current_step = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InterpreterCommandRequest
    // Serialize message field [user_command]
    bufferOffset = _serializer.string(obj.user_command, buffer, bufferOffset);
    // Serialize message field [current_step]
    bufferOffset = _serializer.string(obj.current_step, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InterpreterCommandRequest
    let len;
    let data = new InterpreterCommandRequest(null);
    // Deserialize message field [user_command]
    data.user_command = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [current_step]
    data.current_step = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.user_command);
    length += _getByteLength(object.current_step);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/InterpreterCommandRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f6680fa6dc6ba89d32386ab909f49a08';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request
    string user_command
    string current_step
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InterpreterCommandRequest(null);
    if (msg.user_command !== undefined) {
      resolved.user_command = msg.user_command;
    }
    else {
      resolved.user_command = ''
    }

    if (msg.current_step !== undefined) {
      resolved.current_step = msg.current_step;
    }
    else {
      resolved.current_step = ''
    }

    return resolved;
    }
};

class InterpreterCommandResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.valid = null;
      this.interpreted_action = null;
    }
    else {
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
      if (initObj.hasOwnProperty('interpreted_action')) {
        this.interpreted_action = initObj.interpreted_action
      }
      else {
        this.interpreted_action = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InterpreterCommandResponse
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    // Serialize message field [interpreted_action]
    bufferOffset = _serializer.string(obj.interpreted_action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InterpreterCommandResponse
    let len;
    let data = new InterpreterCommandResponse(null);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [interpreted_action]
    data.interpreted_action = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.interpreted_action);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignments/InterpreterCommandResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99879187b30a6b5efe9afd019ea80873';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response
    bool valid
    string interpreted_action
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InterpreterCommandResponse(null);
    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    if (msg.interpreted_action !== undefined) {
      resolved.interpreted_action = msg.interpreted_action;
    }
    else {
      resolved.interpreted_action = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: InterpreterCommandRequest,
  Response: InterpreterCommandResponse,
  md5sum() { return '233406fee41744d870c89e8f3e025de8'; },
  datatype() { return 'assignments/InterpreterCommand'; }
};
