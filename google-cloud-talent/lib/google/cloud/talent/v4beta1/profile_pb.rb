# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/talent/v4beta1/profile.proto


require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/field_behavior_pb'
require 'google/cloud/talent/v4beta1/common_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'
require 'google/protobuf/wrappers_pb'
require 'google/type/date_pb'
require 'google/type/postal_address_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.cloud.talent.v4beta1.Profile" do
    optional :name, :string, 1
    optional :external_id, :string, 2
    optional :source, :string, 3
    optional :uri, :string, 4
    optional :group_id, :string, 5
    optional :is_hirable, :message, 6, "google.protobuf.BoolValue"
    optional :create_time, :message, 7, "google.protobuf.Timestamp"
    optional :update_time, :message, 8, "google.protobuf.Timestamp"
    optional :candidate_update_time, :message, 67, "google.protobuf.Timestamp"
    optional :resume_update_time, :message, 68, "google.protobuf.Timestamp"
    optional :resume, :message, 53, "google.cloud.talent.v4beta1.Resume"
    repeated :person_names, :message, 11, "google.cloud.talent.v4beta1.PersonName"
    repeated :addresses, :message, 12, "google.cloud.talent.v4beta1.Address"
    repeated :email_addresses, :message, 13, "google.cloud.talent.v4beta1.Email"
    repeated :phone_numbers, :message, 14, "google.cloud.talent.v4beta1.Phone"
    repeated :personal_uris, :message, 15, "google.cloud.talent.v4beta1.PersonalUri"
    repeated :additional_contact_info, :message, 16, "google.cloud.talent.v4beta1.AdditionalContactInfo"
    repeated :employment_records, :message, 17, "google.cloud.talent.v4beta1.EmploymentRecord"
    repeated :education_records, :message, 18, "google.cloud.talent.v4beta1.EducationRecord"
    repeated :skills, :message, 19, "google.cloud.talent.v4beta1.Skill"
    repeated :activities, :message, 20, "google.cloud.talent.v4beta1.Activity"
    repeated :publications, :message, 21, "google.cloud.talent.v4beta1.Publication"
    repeated :patents, :message, 22, "google.cloud.talent.v4beta1.Patent"
    repeated :certifications, :message, 23, "google.cloud.talent.v4beta1.Certification"
    repeated :applications, :string, 47
    repeated :assignments, :string, 48
    map :custom_attributes, :string, :message, 26, "google.cloud.talent.v4beta1.CustomAttribute"
    optional :processed, :bool, 27
    optional :keyword_snippet, :string, 28
    repeated :availability_signals, :message, 70, "google.cloud.talent.v4beta1.AvailabilitySignal"
    repeated :derived_addresses, :message, 64, "google.cloud.talent.v4beta1.Location"
  end
  add_message "google.cloud.talent.v4beta1.AvailabilitySignal" do
    optional :type, :enum, 1, "google.cloud.talent.v4beta1.AvailabilitySignalType"
    optional :last_update_time, :message, 2, "google.protobuf.Timestamp"
    optional :filter_satisfied, :message, 3, "google.protobuf.BoolValue"
  end
  add_message "google.cloud.talent.v4beta1.Resume" do
    optional :structured_resume, :string, 1
    optional :resume_type, :enum, 2, "google.cloud.talent.v4beta1.Resume.ResumeType"
  end
  add_enum "google.cloud.talent.v4beta1.Resume.ResumeType" do
    value :RESUME_TYPE_UNSPECIFIED, 0
    value :HRXML, 1
    value :OTHER_RESUME_TYPE, 2
  end
  add_message "google.cloud.talent.v4beta1.PersonName" do
    optional :preferred_name, :string, 3
    oneof :person_name do
      optional :formatted_name, :string, 1
      optional :structured_name, :message, 2, "google.cloud.talent.v4beta1.PersonName.PersonStructuredName"
    end
  end
  add_message "google.cloud.talent.v4beta1.PersonName.PersonStructuredName" do
    optional :given_name, :string, 1
    optional :preferred_name, :string, 6
    optional :middle_initial, :string, 2
    optional :family_name, :string, 3
    repeated :suffixes, :string, 4
    repeated :prefixes, :string, 5
  end
  add_message "google.cloud.talent.v4beta1.Address" do
    optional :usage, :enum, 1, "google.cloud.talent.v4beta1.ContactInfoUsage"
    optional :current, :message, 4, "google.protobuf.BoolValue"
    oneof :address do
      optional :unstructured_address, :string, 2
      optional :structured_address, :message, 3, "google.type.PostalAddress"
    end
  end
  add_message "google.cloud.talent.v4beta1.Email" do
    optional :usage, :enum, 1, "google.cloud.talent.v4beta1.ContactInfoUsage"
    optional :email_address, :string, 2
  end
  add_message "google.cloud.talent.v4beta1.Phone" do
    optional :usage, :enum, 1, "google.cloud.talent.v4beta1.ContactInfoUsage"
    optional :type, :enum, 2, "google.cloud.talent.v4beta1.Phone.PhoneType"
    optional :number, :string, 3
    optional :when_available, :string, 4
  end
  add_enum "google.cloud.talent.v4beta1.Phone.PhoneType" do
    value :PHONE_TYPE_UNSPECIFIED, 0
    value :LANDLINE, 1
    value :MOBILE, 2
    value :FAX, 3
    value :PAGER, 4
    value :TTY_OR_TDD, 5
    value :VOICEMAIL, 6
    value :VIRTUAL, 7
    value :VOIP, 8
    value :MOBILE_OR_LANDLINE, 9
  end
  add_message "google.cloud.talent.v4beta1.PersonalUri" do
    optional :uri, :string, 1
  end
  add_message "google.cloud.talent.v4beta1.AdditionalContactInfo" do
    optional :usage, :enum, 1, "google.cloud.talent.v4beta1.ContactInfoUsage"
    optional :name, :string, 2
    optional :contact_id, :string, 3
  end
  add_message "google.cloud.talent.v4beta1.EmploymentRecord" do
    optional :start_date, :message, 1, "google.type.Date"
    optional :end_date, :message, 2, "google.type.Date"
    optional :employer_name, :string, 3
    optional :division_name, :string, 4
    optional :address, :message, 5, "google.cloud.talent.v4beta1.Address"
    optional :job_title, :string, 6
    optional :job_description, :string, 7
    optional :is_supervisor, :message, 8, "google.protobuf.BoolValue"
    optional :is_self_employed, :message, 9, "google.protobuf.BoolValue"
    optional :is_current, :message, 10, "google.protobuf.BoolValue"
    optional :job_title_snippet, :string, 11
    optional :job_description_snippet, :string, 12
    optional :employer_name_snippet, :string, 13
  end
  add_message "google.cloud.talent.v4beta1.EducationRecord" do
    optional :start_date, :message, 1, "google.type.Date"
    optional :end_date, :message, 2, "google.type.Date"
    optional :expected_graduation_date, :message, 3, "google.type.Date"
    optional :school_name, :string, 4
    optional :address, :message, 5, "google.cloud.talent.v4beta1.Address"
    optional :description, :string, 8
    optional :is_current, :message, 9, "google.protobuf.BoolValue"
    optional :school_name_snippet, :string, 10
    optional :degree_snippet, :string, 11
    oneof :degree do
      optional :degree_description, :string, 6
      optional :structured_degree, :message, 7, "google.cloud.talent.v4beta1.Degree"
    end
  end
  add_message "google.cloud.talent.v4beta1.Degree" do
    optional :degree_type, :enum, 1, "google.cloud.talent.v4beta1.DegreeType"
    optional :degree_name, :string, 2
    repeated :fields_of_study, :string, 3
  end
  add_message "google.cloud.talent.v4beta1.Activity" do
    optional :display_name, :string, 1
    optional :description, :string, 2
    optional :uri, :string, 3
    optional :create_date, :message, 4, "google.type.Date"
    optional :update_date, :message, 5, "google.type.Date"
    repeated :team_members, :string, 6
    repeated :skills_used, :message, 7, "google.cloud.talent.v4beta1.Skill"
    optional :activity_name_snippet, :string, 8
    optional :activity_description_snippet, :string, 9
    repeated :skills_used_snippet, :string, 10
  end
  add_message "google.cloud.talent.v4beta1.Publication" do
    repeated :authors, :string, 1
    optional :title, :string, 2
    optional :description, :string, 3
    optional :journal, :string, 4
    optional :volume, :string, 5
    optional :publisher, :string, 6
    optional :publication_date, :message, 7, "google.type.Date"
    optional :publication_type, :string, 8
    optional :isbn, :string, 9
  end
  add_message "google.cloud.talent.v4beta1.Patent" do
    optional :display_name, :string, 1
    repeated :inventors, :string, 2
    optional :patent_status, :string, 3
    optional :patent_status_date, :message, 4, "google.type.Date"
    optional :patent_filing_date, :message, 5, "google.type.Date"
    optional :patent_office, :string, 6
    optional :patent_number, :string, 7
    optional :patent_description, :string, 8
    repeated :skills_used, :message, 9, "google.cloud.talent.v4beta1.Skill"
  end
end

module Google
  module Cloud
    module Talent
      module V4beta1
        Profile = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Profile").msgclass
        AvailabilitySignal = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.AvailabilitySignal").msgclass
        Resume = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Resume").msgclass
        Resume::ResumeType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Resume.ResumeType").enummodule
        PersonName = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.PersonName").msgclass
        PersonName::PersonStructuredName = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.PersonName.PersonStructuredName").msgclass
        Address = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Address").msgclass
        Email = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Email").msgclass
        Phone = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Phone").msgclass
        Phone::PhoneType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Phone.PhoneType").enummodule
        PersonalUri = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.PersonalUri").msgclass
        AdditionalContactInfo = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.AdditionalContactInfo").msgclass
        EmploymentRecord = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.EmploymentRecord").msgclass
        EducationRecord = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.EducationRecord").msgclass
        Degree = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Degree").msgclass
        Activity = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Activity").msgclass
        Publication = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Publication").msgclass
        Patent = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.talent.v4beta1.Patent").msgclass
      end
    end
  end
end