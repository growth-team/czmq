################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

module CZMQ
  module FFI

    # working with single message frames
    class Zframe
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      def initialize ptr, finalize=true
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      def self.create_finalizer_for ptr
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zframe_destroy ptr_ptr
        end
      end
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        ObjectSpace.undefine_finalizer self if @finalizer
        @finalizer = nil
        @ptr = nil
        ptr_ptr
      end

      # Create a new frame. If size is not null, allocates the frame data
      # to the specified size. If additionally, data is not null, copies 
      # size octets from the specified data into the frame body.         
      def self.new(data, size)
        size = Integer(size)
        ptr = ::CZMQ::FFI.zframe_new(data, size)
        __new ptr
      end

      # Destroy a frame
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zframe_destroy(self_p)
        result
      end

      # Create an empty (zero-sized) frame
      def self.new_empty()
        result = ::CZMQ::FFI.zframe_new_empty()
        result = Zframe.__new result, true
        result
      end

      # Create a frame with a specified string content.
      def self.from(string)
        string = String(string)
        result = ::CZMQ::FFI.zframe_from(string)
        result = Zframe.__new result, true
        result
      end

      # Receive frame from socket, returns zframe_t object or NULL if the recv  
      # was interrupted. Does a blocking recv, if you want to not block then use
      # zpoller or zloop.                                                       
      def self.recv(source)
        result = ::CZMQ::FFI.zframe_recv(source)
        result = Zframe.__new result, true
        result
      end

      # Send a frame to a socket, destroy frame after sending.
      # Return -1 on error, 0 on success.                     
      def self.send(self_p, dest, flags)
        self_p = self_p.__ptr_give_ref
        flags = Integer(flags)
        result = ::CZMQ::FFI.zframe_send(self_p, dest, flags)
        result
      end

      # Return number of bytes in frame data
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_size(self_p)
        result
      end

      # Return address of frame data
      def data()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_data(self_p)
        result
      end

      # Create a new frame that duplicates an existing frame. If frame is null,
      # or memory was exhausted, returns null.                                 
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_dup(self_p)
        result = Zframe.__new result, true
        result
      end

      # Return frame data encoded as printable hex string, useful for 0MQ UUIDs.
      # Caller must free string when finished with it.                          
      def strhex()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_strhex(self_p)
        result
      end

      # Return frame data copied into freshly allocated string
      # Caller must free string when finished with it.        
      def strdup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_strdup(self_p)
        result
      end

      # Return TRUE if frame body is equal to string, excluding terminator
      def streq(string)
        raise DestroyedError unless @ptr
        self_p = @ptr
        string = String(string)
        result = ::CZMQ::FFI.zframe_streq(self_p, string)
        result
      end

      # Return frame MORE indicator (1 or 0), set when reading frame from socket
      # or by the zframe_set_more() method                                      
      def more()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_more(self_p)
        result
      end

      # Set frame MORE indicator (1 or 0). Note this is NOT used when sending
      # frame to socket, you have to specify flag explicitly.                
      def set_more(more)
        raise DestroyedError unless @ptr
        self_p = @ptr
        more = Integer(more)
        result = ::CZMQ::FFI.zframe_set_more(self_p, more)
        result
      end

      # Return frame routing ID, if the frame came from a ZMQ_SERVER socket.
      # Else returns zero.                                                  
      def routing_id()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_routing_id(self_p)
        result
      end

      # Set routing ID on frame. This is used if/when the frame is sent to a
      # ZMQ_SERVER socket.                                                  
      def set_routing_id(routing_id)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_set_routing_id(self_p, routing_id)
        result
      end

      # Return TRUE if two frames have identical size and data
      # If either frame is NULL, equality is always false.    
      def eq(other)
        raise DestroyedError unless @ptr
        self_p = @ptr
        other = other.__ptr if other
        result = ::CZMQ::FFI.zframe_eq(self_p, other)
        result
      end

      # Set new contents for frame
      def reset(data, size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        size = Integer(size)
        result = ::CZMQ::FFI.zframe_reset(self_p, data, size)
        result
      end

      # Send message to zsys log sink (may be stdout, or system facility as       
      # configured by zsys_set_logstream). Prefix shows before frame, if not null.
      def print(prefix)
        raise DestroyedError unless @ptr
        self_p = @ptr
        prefix = String(prefix)
        result = ::CZMQ::FFI.zframe_print(self_p, prefix)
        result
      end

      # Probe the supplied object, and report if it looks like a zframe_t.
      def self.is(self_)
        result = ::CZMQ::FFI.zframe_is(self_)
        result
      end

      # Self test of this class
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zframe_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
