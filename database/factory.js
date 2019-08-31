"use strict";

/*
|--------------------------------------------------------------------------
| Factory
|--------------------------------------------------------------------------
|
| Factories are used to define blueprints for database tables or Lucid
| models. Later you can use these blueprints to seed your database
| with dummy data.
|
*/
/** @type {import('@adonisjs/framework/src/Hash')} */
const Hash = use("Hash");

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use("Factory");

Factory.blueprint("App/Models/Categories", async faker => {
  return {
    category_name: faker.username().toUpperCase()
  };
});

Factory.blueprint("App/Models/Companies", async faker => {
  return {
    company_fantasy_name: faker.username().toUpperCase(),
    company_cnpj: faker.username().toUpperCase(),
    company_phone: faker.username().toUpperCase(),
    company_street: faker.username().toUpperCase(),
    company_number: faker.username().toUpperCase(),
    company_district: faker.username().toUpperCase(),
    company_logo: faker.avatar({fileExtension: 'jpg'}),
    company_description: faker.sentence(),
    company_url: faker.username().toLowerCase(),
    user_id: 1
  };
});

Factory.blueprint("App/Models/Products", async faker => {
  return {
    product_name: faker.username().toUpperCase(),
    product_description	: faker.username().toUpperCase(),
    product_image:		 faker.avatar({fileExtension: 'jpg'}),
    company_id: 		1,
    category_id: 		1
  };
});
