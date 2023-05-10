import { Router } from "express";
import { prisma } from "./prisma";

export const rotas = Router()

rotas.get('/', async (req, res) => {
    const consultas = await prisma.consultas.findMany()
    res.json(consultas)

})

rotas.post('/create', async (req, res) => { 
const {nome, cpf, numerocarteira, especialidademedica, data, hora } = req.body

const marcarConsultas = await prisma.consultas.create({
    data:{
        cpf:cpf,
        data: data,
        especialidademedica:especialidademedica,
        numerocarteira:numerocarteira,
        nome:nome,
        hora:hora
    }


   
}) 
res.json(marcarConsultas)



})
rotas.delete('/delete/:id', async (req, res) => { 
    const {id} = req.params 
    const cancelarConsulta = await prisma.consultas.delete({
        where: {
            id: id
        }
    })
    res.json("dado deletado!!")
})

rotas.put('/edit/:id', async (req, res) => { 
const {id} = req.params 
const {especialidademedica} = req.body
const editarConsultas = await prisma.consultas.update({
    where:{
        id: id 
    },
    data: {
        especialidademedica: especialidademedica
        }
})
res.json("editado!!")

})

