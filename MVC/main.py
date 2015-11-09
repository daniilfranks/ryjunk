import mvc

from mock import Mock

controller = mvc.Controller()
 
# Displaying Summary for defect id # 2
controller.getDefectSummary(2)
controller.getDefectSummary(1)
controller.getDefectSummary(3)
 
# Displaying defect list for 'ABC' Component
controller.getDefectList('ABC')


# Displaying defect list for 'XYZ' Component
controller.getDefectList('XYZ')


Model = mvc.DefectModel()

Model.getDefectList = Mock()
Model.getDefectList.return_value = ['37','98']
Model.getSummary  = Mock()
Model.getSummary.return_value = 33


controller1 = mvc.Controller(model=Model)

print 'Mocking Model'

controller1.getDefectSummary(3)
controller1.getDefectList('XYZ')


print 'Alternative View'

View = mvc.FileDefectView('testview')

controller2 = mvc.Controller(view=View)

controller2.getDefectSummary(3)
controller2.getDefectList('XYZ')
