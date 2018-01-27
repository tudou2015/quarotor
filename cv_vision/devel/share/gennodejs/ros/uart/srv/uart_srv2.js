// Auto-generated. Do not edit!

// (in-package uart.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class uart_srv2Request {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input = null;
    }
    else {
      if (initObj.hasOwnProperty('input')) {
        this.input = initObj.input
      }
      else {
        this.input = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type uart_srv2Request
    // Serialize message field [input]
    bufferOffset = _arraySerializer.uint8(obj.input, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type uart_srv2Request
    let len;
    let data = new uart_srv2Request(null);
    // Deserialize message field [input]
    data.input = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.input.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'uart/uart_srv2Request';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'abd76d87c8b5a6df7f98d6fac7425412';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8[] input
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new uart_srv2Request(null);
    if (msg.input !== undefined) {
      resolved.input = msg.input;
    }
    else {
      resolved.input = []
    }

    return resolved;
    }
};

class uart_srv2Response {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output = null;
    }
    else {
      if (initObj.hasOwnProperty('output')) {
        this.output = initObj.output
      }
      else {
        this.output = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type uart_srv2Response
    // Serialize message field [output]
    bufferOffset = _serializer.int32(obj.output, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type uart_srv2Response
    let len;
    let data = new uart_srv2Response(null);
    // Deserialize message field [output]
    data.output = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'uart/uart_srv2Response';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd5fc6b37f5643970fe87c91f31f11e4a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 output
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new uart_srv2Response(null);
    if (msg.output !== undefined) {
      resolved.output = msg.output;
    }
    else {
      resolved.output = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: uart_srv2Request,
  Response: uart_srv2Response,
  md5sum() { return 'f3fd65dfbcbf72139f8cc955ff4cf532'; },
  datatype() { return 'uart/uart_srv2'; }
};
