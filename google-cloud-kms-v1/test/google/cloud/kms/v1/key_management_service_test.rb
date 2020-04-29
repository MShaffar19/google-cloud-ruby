# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/kms/v1/service_pb"
require "google/cloud/kms/v1/service_services_pb"
require "google/cloud/kms/v1/key_management_service"

class ::Google::Cloud::Kms::V1::KeyManagementService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_list_key_rings
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::ListKeyRingsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    filter = "hello world"
    order_by = "hello world"

    list_key_rings_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_key_rings, name
      assert_kind_of ::Google::Cloud::Kms::V1::ListKeyRingsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.filter
      assert_equal "hello world", request.order_by
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_key_rings_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_key_rings({ parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_key_rings parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_key_rings ::Google::Cloud::Kms::V1::ListKeyRingsRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_key_rings({ parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_key_rings ::Google::Cloud::Kms::V1::ListKeyRingsRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_key_rings_client_stub.call_rpc_count
    end
  end

  def test_list_crypto_keys
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::ListCryptoKeysResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    version_view = :CRYPTO_KEY_VERSION_VIEW_UNSPECIFIED
    filter = "hello world"
    order_by = "hello world"

    list_crypto_keys_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_crypto_keys, name
      assert_kind_of ::Google::Cloud::Kms::V1::ListCryptoKeysRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal :CRYPTO_KEY_VERSION_VIEW_UNSPECIFIED, request.version_view
      assert_equal "hello world", request.filter
      assert_equal "hello world", request.order_by
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_crypto_keys_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_crypto_keys({ parent: parent, page_size: page_size, page_token: page_token, version_view: version_view, filter: filter, order_by: order_by }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_crypto_keys parent: parent, page_size: page_size, page_token: page_token, version_view: version_view, filter: filter, order_by: order_by do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_crypto_keys ::Google::Cloud::Kms::V1::ListCryptoKeysRequest.new(parent: parent, page_size: page_size, page_token: page_token, version_view: version_view, filter: filter, order_by: order_by) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_crypto_keys({ parent: parent, page_size: page_size, page_token: page_token, version_view: version_view, filter: filter, order_by: order_by }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_crypto_keys ::Google::Cloud::Kms::V1::ListCryptoKeysRequest.new(parent: parent, page_size: page_size, page_token: page_token, version_view: version_view, filter: filter, order_by: order_by), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_crypto_keys_client_stub.call_rpc_count
    end
  end

  def test_list_crypto_key_versions
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::ListCryptoKeyVersionsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    view = :CRYPTO_KEY_VERSION_VIEW_UNSPECIFIED
    filter = "hello world"
    order_by = "hello world"

    list_crypto_key_versions_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_crypto_key_versions, name
      assert_kind_of ::Google::Cloud::Kms::V1::ListCryptoKeyVersionsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal :CRYPTO_KEY_VERSION_VIEW_UNSPECIFIED, request.view
      assert_equal "hello world", request.filter
      assert_equal "hello world", request.order_by
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_crypto_key_versions_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_crypto_key_versions({ parent: parent, page_size: page_size, page_token: page_token, view: view, filter: filter, order_by: order_by }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_crypto_key_versions parent: parent, page_size: page_size, page_token: page_token, view: view, filter: filter, order_by: order_by do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_crypto_key_versions ::Google::Cloud::Kms::V1::ListCryptoKeyVersionsRequest.new(parent: parent, page_size: page_size, page_token: page_token, view: view, filter: filter, order_by: order_by) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_crypto_key_versions({ parent: parent, page_size: page_size, page_token: page_token, view: view, filter: filter, order_by: order_by }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_crypto_key_versions ::Google::Cloud::Kms::V1::ListCryptoKeyVersionsRequest.new(parent: parent, page_size: page_size, page_token: page_token, view: view, filter: filter, order_by: order_by), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_crypto_key_versions_client_stub.call_rpc_count
    end
  end

  def test_list_import_jobs
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::ListImportJobsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    filter = "hello world"
    order_by = "hello world"

    list_import_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_import_jobs, name
      assert_kind_of ::Google::Cloud::Kms::V1::ListImportJobsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.filter
      assert_equal "hello world", request.order_by
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_import_jobs_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_import_jobs({ parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_import_jobs parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_import_jobs ::Google::Cloud::Kms::V1::ListImportJobsRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_import_jobs({ parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_import_jobs ::Google::Cloud::Kms::V1::ListImportJobsRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_import_jobs_client_stub.call_rpc_count
    end
  end

  def test_get_key_ring
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::KeyRing.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_key_ring_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_key_ring, name
      assert_kind_of ::Google::Cloud::Kms::V1::GetKeyRingRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_key_ring_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_key_ring({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_key_ring name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_key_ring ::Google::Cloud::Kms::V1::GetKeyRingRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_key_ring({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_key_ring ::Google::Cloud::Kms::V1::GetKeyRingRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_key_ring_client_stub.call_rpc_count
    end
  end

  def test_get_crypto_key
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_crypto_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_crypto_key, name
      assert_kind_of ::Google::Cloud::Kms::V1::GetCryptoKeyRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_crypto_key_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_crypto_key({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_crypto_key name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_crypto_key ::Google::Cloud::Kms::V1::GetCryptoKeyRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_crypto_key({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_crypto_key ::Google::Cloud::Kms::V1::GetCryptoKeyRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_crypto_key_client_stub.call_rpc_count
    end
  end

  def test_get_crypto_key_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKeyVersion.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_crypto_key_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_crypto_key_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::GetCryptoKeyVersionRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_crypto_key_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_crypto_key_version({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_crypto_key_version name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_crypto_key_version ::Google::Cloud::Kms::V1::GetCryptoKeyVersionRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_crypto_key_version({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_crypto_key_version ::Google::Cloud::Kms::V1::GetCryptoKeyVersionRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_crypto_key_version_client_stub.call_rpc_count
    end
  end

  def test_get_public_key
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::PublicKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_public_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_public_key, name
      assert_kind_of ::Google::Cloud::Kms::V1::GetPublicKeyRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_public_key_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_public_key({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_public_key name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_public_key ::Google::Cloud::Kms::V1::GetPublicKeyRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_public_key({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_public_key ::Google::Cloud::Kms::V1::GetPublicKeyRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_public_key_client_stub.call_rpc_count
    end
  end

  def test_get_import_job
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::ImportJob.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_import_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_import_job, name
      assert_kind_of ::Google::Cloud::Kms::V1::GetImportJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_import_job_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_import_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_import_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_import_job ::Google::Cloud::Kms::V1::GetImportJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_import_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_import_job ::Google::Cloud::Kms::V1::GetImportJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_import_job_client_stub.call_rpc_count
    end
  end

  def test_create_key_ring
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::KeyRing.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    key_ring_id = "hello world"
    key_ring = {}

    create_key_ring_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_key_ring, name
      assert_kind_of ::Google::Cloud::Kms::V1::CreateKeyRingRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.key_ring_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::KeyRing), request.key_ring
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_key_ring_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_key_ring({ parent: parent, key_ring_id: key_ring_id, key_ring: key_ring }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_key_ring parent: parent, key_ring_id: key_ring_id, key_ring: key_ring do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_key_ring ::Google::Cloud::Kms::V1::CreateKeyRingRequest.new(parent: parent, key_ring_id: key_ring_id, key_ring: key_ring) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_key_ring({ parent: parent, key_ring_id: key_ring_id, key_ring: key_ring }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_key_ring ::Google::Cloud::Kms::V1::CreateKeyRingRequest.new(parent: parent, key_ring_id: key_ring_id, key_ring: key_ring), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_key_ring_client_stub.call_rpc_count
    end
  end

  def test_create_crypto_key
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    crypto_key_id = "hello world"
    crypto_key = {}
    skip_initial_version_creation = true

    create_crypto_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_crypto_key, name
      assert_kind_of ::Google::Cloud::Kms::V1::CreateCryptoKeyRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.crypto_key_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::CryptoKey), request.crypto_key
      assert_equal true, request.skip_initial_version_creation
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_crypto_key_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_crypto_key({ parent: parent, crypto_key_id: crypto_key_id, crypto_key: crypto_key, skip_initial_version_creation: skip_initial_version_creation }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_crypto_key parent: parent, crypto_key_id: crypto_key_id, crypto_key: crypto_key, skip_initial_version_creation: skip_initial_version_creation do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_crypto_key ::Google::Cloud::Kms::V1::CreateCryptoKeyRequest.new(parent: parent, crypto_key_id: crypto_key_id, crypto_key: crypto_key, skip_initial_version_creation: skip_initial_version_creation) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_crypto_key({ parent: parent, crypto_key_id: crypto_key_id, crypto_key: crypto_key, skip_initial_version_creation: skip_initial_version_creation }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_crypto_key ::Google::Cloud::Kms::V1::CreateCryptoKeyRequest.new(parent: parent, crypto_key_id: crypto_key_id, crypto_key: crypto_key, skip_initial_version_creation: skip_initial_version_creation), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_crypto_key_client_stub.call_rpc_count
    end
  end

  def test_create_crypto_key_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKeyVersion.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    crypto_key_version = {}

    create_crypto_key_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_crypto_key_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::CreateCryptoKeyVersionRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::CryptoKeyVersion), request.crypto_key_version
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_crypto_key_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_crypto_key_version({ parent: parent, crypto_key_version: crypto_key_version }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_crypto_key_version parent: parent, crypto_key_version: crypto_key_version do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_crypto_key_version ::Google::Cloud::Kms::V1::CreateCryptoKeyVersionRequest.new(parent: parent, crypto_key_version: crypto_key_version) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_crypto_key_version({ parent: parent, crypto_key_version: crypto_key_version }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_crypto_key_version ::Google::Cloud::Kms::V1::CreateCryptoKeyVersionRequest.new(parent: parent, crypto_key_version: crypto_key_version), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_crypto_key_version_client_stub.call_rpc_count
    end
  end

  def test_import_crypto_key_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKeyVersion.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"

    import_crypto_key_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :import_crypto_key_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::ImportCryptoKeyVersionRequest, request
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, import_crypto_key_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.import_crypto_key_version({ parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.import_crypto_key_version parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.import_crypto_key_version ::Google::Cloud::Kms::V1::ImportCryptoKeyVersionRequest.new(parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.import_crypto_key_version({ parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.import_crypto_key_version ::Google::Cloud::Kms::V1::ImportCryptoKeyVersionRequest.new(parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, import_crypto_key_version_client_stub.call_rpc_count
    end
  end

  def test_create_import_job
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::ImportJob.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    import_job_id = "hello world"
    import_job = {}

    create_import_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_import_job, name
      assert_kind_of ::Google::Cloud::Kms::V1::CreateImportJobRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.import_job_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::ImportJob), request.import_job
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_import_job_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_import_job({ parent: parent, import_job_id: import_job_id, import_job: import_job }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_import_job parent: parent, import_job_id: import_job_id, import_job: import_job do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_import_job ::Google::Cloud::Kms::V1::CreateImportJobRequest.new(parent: parent, import_job_id: import_job_id, import_job: import_job) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_import_job({ parent: parent, import_job_id: import_job_id, import_job: import_job }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_import_job ::Google::Cloud::Kms::V1::CreateImportJobRequest.new(parent: parent, import_job_id: import_job_id, import_job: import_job), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_import_job_client_stub.call_rpc_count
    end
  end

  def test_update_crypto_key
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    crypto_key = {}
    update_mask = {}

    update_crypto_key_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_crypto_key, name
      assert_kind_of ::Google::Cloud::Kms::V1::UpdateCryptoKeyRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::CryptoKey), request.crypto_key
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_crypto_key_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_crypto_key({ crypto_key: crypto_key, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_crypto_key crypto_key: crypto_key, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_crypto_key ::Google::Cloud::Kms::V1::UpdateCryptoKeyRequest.new(crypto_key: crypto_key, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_crypto_key({ crypto_key: crypto_key, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_crypto_key ::Google::Cloud::Kms::V1::UpdateCryptoKeyRequest.new(crypto_key: crypto_key, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_crypto_key_client_stub.call_rpc_count
    end
  end

  def test_update_crypto_key_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKeyVersion.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    crypto_key_version = {}
    update_mask = {}

    update_crypto_key_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_crypto_key_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::UpdateCryptoKeyVersionRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::CryptoKeyVersion), request.crypto_key_version
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_crypto_key_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_crypto_key_version({ crypto_key_version: crypto_key_version, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_crypto_key_version crypto_key_version: crypto_key_version, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_crypto_key_version ::Google::Cloud::Kms::V1::UpdateCryptoKeyVersionRequest.new(crypto_key_version: crypto_key_version, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_crypto_key_version({ crypto_key_version: crypto_key_version, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_crypto_key_version ::Google::Cloud::Kms::V1::UpdateCryptoKeyVersionRequest.new(crypto_key_version: crypto_key_version, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_crypto_key_version_client_stub.call_rpc_count
    end
  end

  def test_encrypt
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::EncryptResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    plaintext = "hello world"
    additional_authenticated_data = "hello world"

    encrypt_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :encrypt, name
      assert_kind_of ::Google::Cloud::Kms::V1::EncryptRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.plaintext
      assert_equal "hello world", request.additional_authenticated_data
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, encrypt_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.encrypt({ name: name, plaintext: plaintext, additional_authenticated_data: additional_authenticated_data }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.encrypt name: name, plaintext: plaintext, additional_authenticated_data: additional_authenticated_data do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.encrypt ::Google::Cloud::Kms::V1::EncryptRequest.new(name: name, plaintext: plaintext, additional_authenticated_data: additional_authenticated_data) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.encrypt({ name: name, plaintext: plaintext, additional_authenticated_data: additional_authenticated_data }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.encrypt ::Google::Cloud::Kms::V1::EncryptRequest.new(name: name, plaintext: plaintext, additional_authenticated_data: additional_authenticated_data), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, encrypt_client_stub.call_rpc_count
    end
  end

  def test_decrypt
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::DecryptResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    ciphertext = "hello world"
    additional_authenticated_data = "hello world"

    decrypt_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :decrypt, name
      assert_kind_of ::Google::Cloud::Kms::V1::DecryptRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.ciphertext
      assert_equal "hello world", request.additional_authenticated_data
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, decrypt_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.decrypt({ name: name, ciphertext: ciphertext, additional_authenticated_data: additional_authenticated_data }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.decrypt name: name, ciphertext: ciphertext, additional_authenticated_data: additional_authenticated_data do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.decrypt ::Google::Cloud::Kms::V1::DecryptRequest.new(name: name, ciphertext: ciphertext, additional_authenticated_data: additional_authenticated_data) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.decrypt({ name: name, ciphertext: ciphertext, additional_authenticated_data: additional_authenticated_data }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.decrypt ::Google::Cloud::Kms::V1::DecryptRequest.new(name: name, ciphertext: ciphertext, additional_authenticated_data: additional_authenticated_data), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, decrypt_client_stub.call_rpc_count
    end
  end

  def test_asymmetric_sign
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::AsymmetricSignResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    digest = {}

    asymmetric_sign_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :asymmetric_sign, name
      assert_kind_of ::Google::Cloud::Kms::V1::AsymmetricSignRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Kms::V1::Digest), request.digest
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, asymmetric_sign_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.asymmetric_sign({ name: name, digest: digest }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.asymmetric_sign name: name, digest: digest do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.asymmetric_sign ::Google::Cloud::Kms::V1::AsymmetricSignRequest.new(name: name, digest: digest) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.asymmetric_sign({ name: name, digest: digest }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.asymmetric_sign ::Google::Cloud::Kms::V1::AsymmetricSignRequest.new(name: name, digest: digest), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, asymmetric_sign_client_stub.call_rpc_count
    end
  end

  def test_asymmetric_decrypt
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::AsymmetricDecryptResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    ciphertext = "hello world"

    asymmetric_decrypt_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :asymmetric_decrypt, name
      assert_kind_of ::Google::Cloud::Kms::V1::AsymmetricDecryptRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.ciphertext
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, asymmetric_decrypt_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.asymmetric_decrypt({ name: name, ciphertext: ciphertext }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.asymmetric_decrypt name: name, ciphertext: ciphertext do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.asymmetric_decrypt ::Google::Cloud::Kms::V1::AsymmetricDecryptRequest.new(name: name, ciphertext: ciphertext) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.asymmetric_decrypt({ name: name, ciphertext: ciphertext }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.asymmetric_decrypt ::Google::Cloud::Kms::V1::AsymmetricDecryptRequest.new(name: name, ciphertext: ciphertext), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, asymmetric_decrypt_client_stub.call_rpc_count
    end
  end

  def test_update_crypto_key_primary_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKey.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    crypto_key_version_id = "hello world"

    update_crypto_key_primary_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_crypto_key_primary_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::UpdateCryptoKeyPrimaryVersionRequest, request
      assert_equal "hello world", request.name
      assert_equal "hello world", request.crypto_key_version_id
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_crypto_key_primary_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_crypto_key_primary_version({ name: name, crypto_key_version_id: crypto_key_version_id }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_crypto_key_primary_version name: name, crypto_key_version_id: crypto_key_version_id do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_crypto_key_primary_version ::Google::Cloud::Kms::V1::UpdateCryptoKeyPrimaryVersionRequest.new(name: name, crypto_key_version_id: crypto_key_version_id) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_crypto_key_primary_version({ name: name, crypto_key_version_id: crypto_key_version_id }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_crypto_key_primary_version ::Google::Cloud::Kms::V1::UpdateCryptoKeyPrimaryVersionRequest.new(name: name, crypto_key_version_id: crypto_key_version_id), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_crypto_key_primary_version_client_stub.call_rpc_count
    end
  end

  def test_destroy_crypto_key_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKeyVersion.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    destroy_crypto_key_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :destroy_crypto_key_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::DestroyCryptoKeyVersionRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, destroy_crypto_key_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.destroy_crypto_key_version({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.destroy_crypto_key_version name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.destroy_crypto_key_version ::Google::Cloud::Kms::V1::DestroyCryptoKeyVersionRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.destroy_crypto_key_version({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.destroy_crypto_key_version ::Google::Cloud::Kms::V1::DestroyCryptoKeyVersionRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, destroy_crypto_key_version_client_stub.call_rpc_count
    end
  end

  def test_restore_crypto_key_version
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Kms::V1::CryptoKeyVersion.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    restore_crypto_key_version_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :restore_crypto_key_version, name
      assert_kind_of ::Google::Cloud::Kms::V1::RestoreCryptoKeyVersionRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, restore_crypto_key_version_client_stub do
      # Create client
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.restore_crypto_key_version({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.restore_crypto_key_version name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.restore_crypto_key_version ::Google::Cloud::Kms::V1::RestoreCryptoKeyVersionRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.restore_crypto_key_version({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.restore_crypto_key_version ::Google::Cloud::Kms::V1::RestoreCryptoKeyVersionRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, restore_crypto_key_version_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Kms::V1::KeyManagementService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Kms::V1::KeyManagementService::Client::Configuration, config
  end
end
