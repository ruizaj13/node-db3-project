// scheme-model
const db = require('../../data/db-config')

module.exports = {find, findById, findSteps, add, update, remove}



    function find(){
        return db('schemes')
    }

    function findById(id){
        const schemaObj = db('schemes').where({id}).first()
        return schemaObj ? schemaObj : null
    }

    function findSteps(id){
        return db('steps')
            .join('schemes','schemes.id', 'steps.scheme_id')
            .select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions')
            .where('schemes.id', id)
            .orderBy('steps.step_number')
    }

    function add(scheme){
        return db('schemes')
            .insert(scheme)
            .then(([id]) => {
                return findById(id)
            })
    }

    function update(changes, id){
        return db('schemes')
            .where('id', id)
            .update(changes)
            .then(count => {
                return count > 0 ? findById(id) : null
            })
    }

    async function remove(id){
        const rmvd = await findById(id)
        return db('schemes')
            .where({id})
            .del()
            .then(() => {
                return rmvd
            })
    }

