require_relative 'task'
require_relative 'task_repository'
require_relative 'controller'
require_relative 'view'
require_relative 'router'

dishes = Task.new("Clean the dishes")

task_repo = TaskRepository.new
view = View.new


controller = Controller.new(view, task_repo)
router = Router.new(controller)
router.run