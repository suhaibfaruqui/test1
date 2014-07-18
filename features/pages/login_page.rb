class LoginPage
    def initialize(browser)
		@browser = browser
	end
	def visit
		@browser.goto 'flipkart.com'
	end
	def login(id, password)
		@browser.text_field(:id, 'login_email_id').set id
		@browser.text_field(:id, 'login_password').set password
		@browser.send_keys :enter 
	end
	def search(item)
		@browser.text_field(:id, 'fk-top-search-box').set item
		@browser.button(:class, 'search-bar-submit fk-font-13 fk-font-bold').click
		sleep(2)
	end
	def add_add(name,pincode,address,phone)
		@browser.span(:class, 'add_address_btn btn btn-white-yellow').click
		@browser.text_field(:id, 'name').set name
		@browser.text_field(:id, 'pincode').set pincode
		@browser.text_field(:id, 'address').set address
		@browser.text_field(:id, 'phone').set phone
		@browser.button(:class, 'btn btn-large btn-orange address_submit').click
		sleep(2)
	end
	def cardentries(cardno, name)
		@browser.frame(:id => 'co_fk_pg').text_field(:name, 'pan').set cardno
		@browser.frame(:id => 'co_fk_pg').text_field(:name, 'nameoncard').set name
	end	
  end