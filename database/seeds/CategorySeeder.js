"use strict";

/*
|--------------------------------------------------------------------------
| CategorySeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use("Factory");

class CategorySeeder {
  async run() {
    const plan = await Factory.model("App/Models/Categories").createMany(10);
  }
}

module.exports = CategorySeeder;
