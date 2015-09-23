# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.find_or_create_by([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.find_or_create_by(name: 'Emanuel', city: cities.first)

# 100.times do
#    User.find_or_create_by!( first_name: Faker::Name.first_name,
#                   last_name: Faker::Name.last_name,
#                   email: Faker::Internet.free_email,
#                   password: Faker::Internet.password(8))
# end

donations = Category.find_or_create_by!(name: "Donations")
lang_exchange = Category.find_or_create_by!(name: "Language Exchange")
immig_serv = Category.find_or_create_by!(name: "Immigration Services")
transportation = Category.find_or_create_by!(name: "Transportation")
esl = Category.find_or_create_by!(name: "ESL")
jobs = Category.find_or_create_by!(name: "Jobs")
childcare = Category.find_or_create_by!(name: "Childcare")
legal = Category.find_or_create_by!(name: "Legal")
misc = Category.find_or_create_by!(name: "Miscellaneous")
event = Category.find_or_create_by!(name: "Events")
health = Category.find_or_create_by!(name: "Health Services")


donations.organizations << Organization.find_or_create_by!(name: "Word of Truth Outreach", website: "http://wotdmoutreach-com.webs.com/", description: "Helping others every day.", address_1: "1845 W 35TH ST", address_2: "", city: "Chicago", state: "IL", zip: "60609")
donations.organizations << Organization.find_or_create_by!(name: "530 Fullerton Foundation", website: "http://530fullertonfoundation.org/", description: "", address_1: "530 W FULLERTON PKWY", address_2: "", city: "Chicago", state: "IL", zip: "60614")
donations.organizations << Organization.find_or_create_by!(name: "San Jose Obrero Mission", website: "http://www.sjom.org/", description: "Phone: 312-532-2775", address_1: "1856 S. Loomis", address_2: "", city: "Chicago", state: "IL", zip: "60608")
lang_exchange.organizations << Organization.find_or_create_by!(name: "Chinese American Service League, Inc.", website: "http://www.caslservice.org/", description: "Phone: 312-791-0418", address_1: "2141 S. Tan Court", address_2: "", city: "Chicago", state: "IL", zip: "60616")
lang_exchange.organizations << Organization.find_or_create_by!(name: "Naturalization Training", website: "http://www.1on1agent.com/", description: "Phone: (312) 791-9999", address_1: "238 W Cermak Rd", address_2: "3FL", city: "", state: "", zip: "60616")
lang_exchange.organizations << Organization.find_or_create_by!(name: "Poder Learning Center", website: "", description: "Phone: (312) 226-2002", address_1: "1637 S. Allport", address_2: "", city: "Chicago", state: "IL", zip: "60608")
lang_exchange.organizations << Organization.find_or_create_by!(name: "Malcolm X College", website: "", description: "Phone: (312) 850-7300", address_1: "1900 W. Van Buren", address_2: "", city: "Chicago", state: "IL", zip: "60612")
lang_exchange.organizations << Organization.find_or_create_by!(name: "Indo American Center", website: "http://indoamerican.org/", description: "Phone: 773 973-4444", address_1: "328 N. California Avenue", address_2: "", city: "Chicago", state: "IL", zip: "60659")
immig_serv.organizations << Organization.find_or_create_by!(name: "World Relief-Chicago", website: "http://worldrelief.org/chicago", description: "Phone: (773) 583-9191", address_1: "3507 W. Lawrence Ave.", address_2: "Suite 208", city: "Chicago", state: "IL", zip: "60625")
immig_serv.organizations << Organization.find_or_create_by!(name: "Heartland- Refugee and Immigrant Community Services", website: "", description: "Phone: 773-728-5960", address_1: "4419 N Ravenswood Ave", address_2: "", city: "Chicago", state: "IL", zip: "60640")
immig_serv.organizations << Organization.find_or_create_by!(name: "Chicago Immigration Court", website: "", description: "Phone: 312-697-5800", address_1: "525 West Van Buren Street", address_2: "Suite 500", city: "Chicago", state: "IL", zip: "60607")
immig_serv.organizations << Organization.find_or_create_by!(name: "Turkish American Society", website: "", description: "Phone: (847) 640-7272", address_1: "501 MIDWAY DR", address_2: "", city: "MOUNT PROSPECT", state: "IL", zip: "60056")
immig_serv.organizations << Organization.find_or_create_by!(name: "National Immigrant Justice Center", website: "http://www.immigrantjustice.org", description: "Phone: (312) 660-1370", address_1: "208 S. LaSalle St.", address_2: "Ste. 1300", city: "Chicago", state: "IL", zip: "60604")
transportation.organizations << Organization.find_or_create_by!(name: "Active Transportation Alliance", website: "http://www.activetrans.org/", description: "", address_1: "9 W Hubbard St", address_2: "Ste 402", city: "Chicago", state: "IL", zip: "60654")
transportation.organizations << Organization.find_or_create_by!(name: "Escorted Transportation Service NW (ETS/NW)", website: "http://www.etsnw.org/", description: "Phone: 847.222.9227", address_1: "1801 W CENTRAL RD", address_2: "", city: "ARLINGTON HTS", state: "IL", zip: "60005")
esl.organizations << Organization.find_or_create_by!(name: "Hanul Family Alliance", website: "http://hanulusa.org/", description: "Phone: 773-478-8851", address_1: "5008 N.KEDZIE AVE", address_2: "", city: "Chicago", state: "IL", zip: "60625")
esl.organizations << Organization.find_or_create_by!(name: "Hull House Uptown Head Start/Even Start", website: "", description: "Phone: (773) 769-5753", address_1: "1020 West Bryn Mawr", address_2: "", city: "Chicago", state: "IL", zip: "60660")
jobs.organizations << Organization.find_or_create_by!(name: "Office of Special Counsel for Immigration-Related Unfair Employment Practices - U.S. Department of Justice - Civil Rights Division", website: "", description: "Phone: (202) 616-5594 Email: osccrt@usdoj.gov", address_1: "950 Pennsylvania Avenue, N.W.", address_2: "OSC, NYA 9000", city: "Washington", state: "DC", zip: "20530")
jobs.organizations << Organization.find_or_create_by!(name: "Youth Job Center", website: "http://www.youthjobcenter.org/", description: "Phone: (847) 864-5627", address_1: "1114 Church Street", address_2: "", city: "Evanston", state: "IL", zip: "60201")
jobs.organizations << Organization.find_or_create_by!(name: "Breaking Ground, Inc.", website: "http://www.breakingground.net/", description: "Phone: 773-265-1370", address_1: "3501 W. Fillmore", address_2: "", city: "Chicago", state: "IL", zip: "60624")
jobs.organizations << Organization.find_or_create_by!(name: "Chicago Commons Employment Training Center", website: "http://www.chicagocommons.org/", description: "", address_1: "3645 W. Chicago Ave.", address_2: "", city: "Chicago", state: "IL", zip: "60651")
childcare.organizations << Organization.find_or_create_by!(name: "Illinois Department of Human Services", website: "", description: "Phone: 1-800-843-6154", address_1: "401 South Clinton Street", address_2: "", city: "Chicago", state: "IL", zip: "60607")
childcare.organizations << Organization.find_or_create_by!(name: "THE YOUNG CENTER FOR IMMIGRANT CHILDREN’S RIGHTS AT THE UNIVERSITY OF CHICAGO", website: "", description: "Phone: 773-702-9560 Email: INFO@THEYOUNGCENTER.ORG", address_1: "6020 SOUTH UNIVERSITY AVENUE", address_2: "", city: "Chicago", state: "IL", zip: "60637")
childcare.organizations << Organization.find_or_create_by!(name: "Bloomington Day Care Center, Inc", website: "", description: "Phone: (309) 661-5600", address_1: "2708 East Lincoln Street", address_2: "", city: "Bloomington", state: "IL", zip: "61704")
childcare.organizations << Organization.find_or_create_by!(name: "Carole Robertson Center for Learning", website: "", description: "Phone: (312) 243-7300", address_1: "2020 West Roosevelt Road", address_2: "", city: "Chicago", state: "IL", zip: "60608")
childcare.organizations << Organization.find_or_create_by!(name: "Educational Day Care Center", website: "", description: "Phone: (217) 243-5720", address_1: "330 West Michigan Avenue", address_2: "", city: "Jacksonville", state: "IL", zip: "62650")
legal.organizations << Organization.find_or_create_by!(name: "LAF (Legal Assistance Foundation of Metropolitan Chicago)", website: "http://www.lafchicago.org/", description: "Phone: 312.341.1070", address_1: "120 S. LaSalle Street", address_2: "Ste. 900", city: "Chicago", state: "IL", zip: "60603")
legal.organizations << Organization.find_or_create_by!(name: "Legal Assistance Foundation of Metropolitan Chicago", website: "", description: "Phone: 312-341-1070", address_1: "120 S. LaSalle Street", address_2: "Suite 900", city: "Chicago", state: "IL", zip: "60603")
legal.organizations << Organization.find_or_create_by!(name: "Chicago  Immigration Court", website: "", description: "Phone: 312-697-5800", address_1: "525 West Van Buren Street", address_2: "Suite 500", city: "Chicago", state: "IL", zip: "60607")
misc.organizations << Organization.find_or_create_by!(name: "Brand New Beginnings", website: "", description: "Phone: 773-955-5780", address_1: "103 E. 58th St.", address_2: "", city: "Chicago", state: "IL", zip: "60637")
health.organizations << Organization.find_or_create_by!(name: "Loyola University Health System Volunteer Services", website: "http://www.loyolamedicine.org/", description: "Phone: (708) 216-3230", address_1: "2160 S 1st Avenue", address_2: "", city: "Maywood", state: "IL", zip: "60153")
health.organizations << Organization.find_or_create_by!(name: "Chicago Women's Health Center", website: "http://www.chicagowomenshealthcenter.org/", description: "Phone: (773) 935-6126", address_1: "3435 N. Sheffield", address_2: "", city: "Chicago", state: "IL", zip: "60657")

