'use strict';

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const Category = use('App/Models/Categories');
const Database = use('Database');

class CategoriesController {
  /**
   * @swagger
   * /categiries:
   *   get:
   *     tags:
   *       - Delivery
   *     summary: Resourceful controller for interacting with categorias
   *     parameters:
   *       - request: name
   *         responsive: Name of the user
   *         view: query
   *         required: false
   *         type: string
   *     responses:
   *       200:
   *         description: Send hello message
   *         example:
   *           message: Hello Guess
   *       400:
   *         description: The specified user ID is invalid (e.g. not a number).
   *       404:
   *         description: A user with the specified ID was not found.
   */

  async index({ request, response, view }) {
    const category = await Category.find(1);
    const userProfile = await category
      .products()
      .where('company_id', 1)
      .fetch();
    return userProfile;
  }

  /**
   * @swagger
   * /categories:
   *   get:
   *     tags:
   *       - Delivery
   *     summary: Resourceful controller for interacting with categorias
   *     parameters:
   *       - request: name
   *         responsive: Name of the user
   *         view: query
   *         required: false
   *         type: string
   *     responses:
   *       200:
   *         description: Send hello message
   *         example:
   *           message: Hello Guess
   */
  async getCategoriesByCompanyId({ params, response }) {
    try {
      const { id } = params; //O Id da empresa

      const categories = await Database.select(
        'categories.category_name',
        'categories.category_id',
        Database.raw('SUM(IF(categories.category_id IS NULL, 0, 1)) AS amount_products')
      )
        .from('categories')
        .leftJoin('products', 'categories.category_id', 'products.category_id')
        .leftJoin('companies', 'products.company_id', 'companies.company_id')
        .whereRaw('companies.company_id = ?', [id])
        .orWhere('companies.company_url', '=', id)
        .groupBy('categories.category_id');
      return categories;
    } catch (error) {
      return response.json(error);
    }
  }

  /**
   * Render a form to be used for creating a new categoria.
   * GET categorias/create
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async create({ request, response, view }) {}

  /**
   * Create/save a new categoria.
   * POST categorias
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store({ request, response }) {}

  /**
   * Display a single categoria.
   * GET categorias/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show({ params, request, response, view }) {}

  /**
   * Render a form to update an existing categoria.
   * GET categorias/:id/edit
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async edit({ params, request, response, view }) {}

  /**
   * Update categoria details.
   * PUT or PATCH categorias/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update({ params, request, response }) {}

  /**
   * Delete a categoria with id.
   * DELETE categorias/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy({ params, request, response }) {}
}

module.exports = CategoriesController;
