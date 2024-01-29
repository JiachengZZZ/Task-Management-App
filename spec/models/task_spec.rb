require "rails_helper"
# FactoryBot.define do
#     factory :task do
#       name { 'Default Task Name' }
#       description { 'Default Task Description' }
#     end
# end

# RSpec.describe Task, type: :model do
#     describe 'validations' do
#       let(:task1) { FactoryBot.create(:task, name: 'Task 1', description: 'Description 1', due_date: Date.tomorrow, difficulty: 'low', estimate: 10) }
#       let(:task2) { FactoryBot.build(:task, name: nil, description: 'Description 2', due_date: Date.tomorrow, difficulty: 'low', estimate: 10) } 
#       let(:task3) { FactoryBot.build(:task, name: 'Task 3', description: nil, due_date: Date.tomorrow, difficulty: 'low', estimate: 5) } 
#       let(:task4) { FactoryBot.create(:task, name: 'Task 4', description: 'Description 4', due_date: Date.tomorrow, difficulty: 'low', estimate: 13) }


#       it 'is valid with valid attributes' do
#         expect(task1).to be_valid
#         expect(task4).to be_valid
#       end
  
#       it 'is not valid without a name' do
#         expect(task2).not_to be_valid
#         expect(task2.errors[:name]).to include("can't be blank")
#       end
  
#       it 'is not valid without a description' do
#         expect(task3).not_to be_valid
#         expect(task3.errors[:description]).to include("can't be blank")
#       end
#     end
# end
FactoryBot.define do
    factory :task do
      name { 'Default Task Name' }
      description { 'Default Task Description' }
      due_date { Date.tomorrow }
      difficulty { 'medium' }  # Assuming '3' represents a valid difficulty level
      estimate { 10 }   # Default value
    end
end

RSpec.describe Task, type: :model do
    describe 'validations' do
      let(:valid_attributes) { { name: 'Task 1', description: 'Description 1', due_date: Date.tomorrow, difficulty: 'medium', estimate: 10} }
      let(:task_without_name) { FactoryBot.build(:task, name: nil) }
      let(:task_without_description) { FactoryBot.build(:task, description: nil) }
    
      it 'is valid with valid attributes' do
        task = FactoryBot.build(:task, valid_attributes)
        expect(task).to be_valid
      end
  
      it 'is not valid without a name' do
        expect(task_without_name).not_to be_valid
        expect(task_without_name.errors[:name]).to include("can't be blank")
      end
  
      it 'is not valid without a description' do
        expect(task_without_description).not_to be_valid
        expect(task_without_description.errors[:description]).to include("can't be blank")
      end
    end
end