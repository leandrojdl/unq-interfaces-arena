package ar.edu.unq.interfaces.cumpleanieroUIArena

import ar.edu.unq.interfaces.cumpleaniero.Person
import ar.edu.unq.interfaces.cumpleaniero.Raffle
import ar.edu.unq.interfaces.cumpleaniero.appModels.Month
import ar.edu.unq.interfaces.cumpleaniero.appModels.NextBirthdaysAppModel
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.LabeledSelector
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Paragraph
import ar.edu.unq.interfaces.cumpleanieroUIArena.components.Title
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class NextBirthdayWindow extends SimpleWindow<NextBirthdaysAppModel>{
	
	new(WindowOwner parent, Raffle raffle) {
		super(parent, new NextBirthdaysAppModel(raffle))
		title = "Próximos"
		taskDescription = ""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Title(mainPanel) => [
			text = "Próximos Cumples"
		]
		
		new Paragraph(mainPanel) => [
			text = "Desde acá podrás buscar los cumpleaños que se vienen en orden para cada mes y año"
		]
		
		var selectsPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		new LabeledSelector(selectsPanel, "Año") => [
			bindValueToProperty = "year"
			bindItemsToProperty = "years"
		]
		
		new LabeledSelector<Month>(selectsPanel, "Mes") => [
			bindValueToProperty = "month"
			bindItemsToProperty = "months"
		]
		
		var assignmentTable = new Table<Person>(mainPanel, typeof(Person)) => [
			bindItemsToProperty = "filteredPeople"
		]
		
		new Column<Person>(assignmentTable) => [
	   		title = "Dia"
			bindContentsToProperty("birthday.dayOfMonth")
		]
		
		new Column<Person>(assignmentTable) => [
	   		title = "Nombre"
			bindContentsToProperty("name")
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
}