Given(/^que me dirijo a la pagina de registro de usuario$/) do
	@browser.goto("localhost:3000/registrar_usuario")
end

Given(/^ingreso "(.*?)" como nombre de usuario$/) do |nombre|
	@browser.text_field(id: "usuario_nombre").set nombre
end

Given(/^ingreso "(.*?)" como email$/) do |email|
	@browser.text_field(id: "usuario_email").set email
end

Given(/^ingreso "(.*?)" como contrasenia$/) do |password|
	@browser.text_field(id: "usuario_password").set password
end

Given(/^confirmo la contrasenia "(.*?)"$/) do |confirm|
	@browser.text_field(id: "usuario_confirme_contrasenia").set confirm
end

When(/^clickeo el boton de crear usuario$/) do
	@browser.button(id: "usuario_crear").click
end

Then(/^me redirecciona a la pagina donde me dice que el usuario ha sido creado$/) do
	expect(@browser.div(class: "exito").h3.div.text).to match /^Usuario creado$/
end

Then(/^sigo en la pagina de creacion de usuario$/) do
	expect(@browser.url).to match /localhost:3000\/registrar_usuario$/
end