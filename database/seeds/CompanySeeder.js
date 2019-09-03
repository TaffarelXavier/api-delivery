'use strict'

/*
|--------------------------------------------------------------------------
| CompanySeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

class CompanySeeder {
  async run () {
    
    //Popula a tabela Company
    const Companies = await Factory.model("App/Models/Companies").createMany(20);

  }
}

module.exports = CompanySeeder
