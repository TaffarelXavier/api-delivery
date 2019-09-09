'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URLs and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.get('/', () => {
  let data = [
    {id:1, name:'Hello world in JSON 1' },
    {id:2, name:'Hello world in JSON 2' },
    {id:3, name:'Hello world in JSON 3' },
    {id:4, name:'Hello world in JSON 4' },
  ]
  return data;
})

Route.resource('companies', 'CompaniesController').apiOnly();

Route.get('categories/company/:id', 'CategoriesController.getCategoriesByCompanyId');

Route.resource('products', 'ProductsController').apiOnly();

Route.resource('categories', 'CategoriesController').apiOnly();

Route.get('products/company/:id', 'ProductsController.getProdutosByEmpresaId');

Route.get('/chat', ({view, response }) => {
  return view.render('chat')
})