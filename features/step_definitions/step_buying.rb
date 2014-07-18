=begin
Given /^I navigate to Flipkart$/ do
@browser.goto "http://www.flipkart.com"
end

And /^I click on login$/ do
  loginLink = @browser.link(:class,  'no-border login-required')
  loginLink.click
end

When /^Enter ID and Password$/ do
loginField = @browser.text_field(:id, 'login_email_id')
loginPass = @browser.text_field(:id, 'login_password')
loginField.set 'suhaib.faruqui@gmail.com'
loginPass.set 'suhaib!'
@browser.send_keys :enter 
sleep(5)
end

And /^Enter book to be searched$/ do
search = @browser.text_field(:id, 'fk-top-search-box')
submit = @browser.button(:class, 'search-bar-submit fk-font-13 fk-font-bold')
search.set 'two states book'
submit.click
sleep(2)
book = @browser.link(:text, '2 States : The Story Of My Marriage (Paperback)')
book.click
sleep(2)
booksearched = @browser.button(:class, 'lmargin5 btn btn-orange btn-buy-big fk-buy-now fkg-pp-buy-btn')
booksearched.click
sleep(4)


end

Then /^Place order$/ do
placeorder = @browser.link(:class, 'btn btn-orange btn-buy-big place-order-button no-underline')
placeorder.click
sleep(2)
add_add = @browser.span(:class, 'add_address_btn btn btn-white-yellow')
add_add.click
name = @browser.text_field(:id, 'name')
pincode = @browser.text_field(:id, 'pincode')
address = @browser.text_field(:id, 'address')
phone = @browser.text_field(:id, 'phone')
name.set 'suhaib umar faruqui'
pincode.set '110025'
address.set 'abc, abc colony, delhi'
phone.set '1234567890'
continue = @browser.button(:class, 'btn btn-large btn-orange address_submit')
continue.click
sleep(2)
phone1 = @browser.text_field(:id, 'os_mobileNumber')
continue3 = @browser.link(:class, 'btn btn-orange btn-large btn-continue no-underline')
phone1.set '9540135467'
sleep(2)
continue3.click
sleep(2)
creditcard = @browser.link(:text, 'Credit Card').click
end
=end

=begin
Given /^I navigate to Flipkart$/ do
@newpage = LoginPage.new(@browser)
@newpage.visit
end

And /^I click on login$/ do
@browser.link(:class,  'no-border login-required').click
end

When /^Enter ID and Password$/ do
@newpage.login('suhaib.faruqui@gmail.com', 'suhaib!')
sleep(5)
end

And /^Enter book to be searched$/ do
@browser.text_field(:id, 'fk-top-search-box').set 'two states book'
@browser.button(:class, 'search-bar-submit fk-font-13 fk-font-bold').click
sleep(2)
@browser.link(:text, '2 States : The Story Of My Marriage (Paperback)').click
sleep(2)
@browser.button(:class, 'lmargin5 btn btn-orange btn-buy-big fk-buy-now fkg-pp-buy-btn').click
sleep(4)
end

Then /^Place order$/ do
@browser.link(:class, 'btn btn-orange btn-buy-big place-order-button no-underline').click
sleep(2)
@browser.span(:class, 'add_address_btn btn btn-white-yellow').click
@browser.text_field(:id, 'name').set 'suhaib umar faruqui'
@browser.text_field(:id, 'pincode').set '110025'
@browser.text_field(:id, 'address').set 'abc, abc colony, delhi'
@browser.text_field(:id, 'phone').set '1234567890'
@browser.button(:class, 'btn btn-large btn-orange address_submit').click
sleep(2)
@browser.text_field(:id, 'os_mobileNumber').set '9540135467'
sleep(2)
@browser.link(:class, 'btn btn-orange btn-large btn-continue no-underline').click
sleep(2)
@browser.link(:text, 'Credit Card').click
sleep(3)


end

When /^User enter wrong credit card no$/ do
@browser.frame(:id => 'co_fk_pg').text_field(:name, 'pan').set '1234561234562345'
@browser.frame(:id => 'co_fk_pg').text_field(:name, 'nameoncard').set 'Suhaib Umar'
end

Then /^Error message is displayed$/ do
(@browser.text.include? 'Please enter a valid card number').should == true
end
=end


Given /^I navigate to Flipkart$/ do
@newpage = LoginPage.new(@browser)
@newpage.visit
end

And /^I click on login$/ do
@browser.link(:class,  'no-border login-required').click
end

When /^Enter ID and Password$/ do
@newpage.login('suhaib.faruqui@gmail.com', 'suhaib!')
sleep(5)
end

And /^Enter book to be searched$/ do
@newpage.search('two states book')
@browser.link(:text, '2 States : The Story Of My Marriage (Paperback)').click
sleep(2)
@browser.button(:class, 'lmargin5 btn btn-orange btn-buy-big fk-buy-now fkg-pp-buy-btn').click
sleep(4)
end


Then /^Place order$/ do
@browser.link(:class, 'btn btn-orange btn-buy-big place-order-button no-underline').click
sleep(2)
@newpage.add_add('shagun', '110025', 'abc, abc colony, delhi', '1234567890')
@browser.text_field(:id, 'os_mobileNumber').set '9540135467'
sleep(2)
@browser.link(:class, 'btn btn-orange btn-large btn-continue no-underline').click
sleep(2)
end

Then /^Payment method "(.+)"$/ do |textnew|
@browser.link(:text, textnew).click
sleep(2)
end
When /^User enter wrong credit card no$/ do
@newpage.cardentries('1234561234562345', 'Suhaib Umar')
end

Then /^Error message is displayed$/ do
(@browser.text.include? 'Please enter a valid card number').should == true
end

