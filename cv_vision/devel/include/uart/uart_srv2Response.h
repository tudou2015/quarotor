// Generated by gencpp from file uart/uart_srv2Response.msg
// DO NOT EDIT!


#ifndef UART_MESSAGE_UART_SRV2RESPONSE_H
#define UART_MESSAGE_UART_SRV2RESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace uart
{
template <class ContainerAllocator>
struct uart_srv2Response_
{
  typedef uart_srv2Response_<ContainerAllocator> Type;

  uart_srv2Response_()
    : output(0)  {
    }
  uart_srv2Response_(const ContainerAllocator& _alloc)
    : output(0)  {
  (void)_alloc;
    }



   typedef int32_t _output_type;
  _output_type output;




  typedef boost::shared_ptr< ::uart::uart_srv2Response_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::uart::uart_srv2Response_<ContainerAllocator> const> ConstPtr;

}; // struct uart_srv2Response_

typedef ::uart::uart_srv2Response_<std::allocator<void> > uart_srv2Response;

typedef boost::shared_ptr< ::uart::uart_srv2Response > uart_srv2ResponsePtr;
typedef boost::shared_ptr< ::uart::uart_srv2Response const> uart_srv2ResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::uart::uart_srv2Response_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::uart::uart_srv2Response_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace uart

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'uart': ['/home/odroid/cv_vision/src/uart/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::uart::uart_srv2Response_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::uart::uart_srv2Response_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::uart::uart_srv2Response_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::uart::uart_srv2Response_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::uart::uart_srv2Response_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::uart::uart_srv2Response_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::uart::uart_srv2Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d5fc6b37f5643970fe87c91f31f11e4a";
  }

  static const char* value(const ::uart::uart_srv2Response_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd5fc6b37f5643970ULL;
  static const uint64_t static_value2 = 0xfe87c91f31f11e4aULL;
};

template<class ContainerAllocator>
struct DataType< ::uart::uart_srv2Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uart/uart_srv2Response";
  }

  static const char* value(const ::uart::uart_srv2Response_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::uart::uart_srv2Response_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 output\n\
\n\
";
  }

  static const char* value(const ::uart::uart_srv2Response_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::uart::uart_srv2Response_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.output);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct uart_srv2Response_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::uart::uart_srv2Response_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::uart::uart_srv2Response_<ContainerAllocator>& v)
  {
    s << indent << "output: ";
    Printer<int32_t>::stream(s, indent + "  ", v.output);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UART_MESSAGE_UART_SRV2RESPONSE_H
