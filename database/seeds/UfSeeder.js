'use strict'

/*
|--------------------------------------------------------------------------
| UfSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

class UfSeeder {
  async run () {
        //Popula a tabela Categoria
        const Uf = await Factory.model("App/Models/Uf").createMany(10);
  }
}

module.exports = UfSeeder
