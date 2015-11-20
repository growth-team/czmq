################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

module CZMQ
  module FFI

    # work with directory patches
    class ZdirPatch
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
          ::CZMQ::FFI.zdir_patch_destroy ptr_ptr
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

      # Create new patch
      def self.new(path, file, op, alias_)
        path = String(path)
        file = file.__ptr if file
        alias_ = String(alias_)
        ptr = ::CZMQ::FFI.zdir_patch_new(path, file, op, alias_)
        __new ptr
      end

      # Destroy a patch
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zdir_patch_destroy(self_p)
        result
      end

      # Create copy of a patch. If the patch is null, or memory was exhausted,
      # returns null.                                                         
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_dup(self_p)
        result
      end

      # Return patch file directory path
      def path()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_path(self_p)
        result
      end

      # Return patch file item
      def file()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_file(self_p)
        result = Zfile.__new result, false
        result
      end

      # Return operation
      def op()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_op(self_p)
        result
      end

      # Return patch virtual file path
      def vpath()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_vpath(self_p)
        result
      end

      # Calculate hash digest for file (create only)
      def digest_set()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_digest_set(self_p)
        result
      end

      # Return hash digest for patch file
      def digest()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_digest(self_p)
        result
      end

      # Self test of this class.
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zdir_patch_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
