# SEEDS FOR EXAMPLE HIERARCHY
#        Root hierarchy
#        GRADE: 3.55
root_ancestry = Management.create(area: 'Gerencia General')

# Management children
#        AVERAGE: 3.55
#        GRADE: 2.1
finances = Management.create(area: 'Gerencia de finanzas', parent_id: root_ancestry.id)
# GRADE: 4.5
operations = Management.create(area: 'Gerencia de operaciones', parent_id: root_ancestry.id)
# GRADE: 4.05
technology = Management.create(area: 'Gerencia de tecnología', parent_id: root_ancestry.id)

#  Department for "Gerencia de finanzas"
#         AVERAGE: 2.1
Management.create(area: 'Contabilidad', parent_id: finances.id, grade: 2.1)
# Department for "Gerencia de operaciones"
#        AVERAGE: 4.5
# =Management.create(area: 'Análisis', parent_id: operations.id, grade: 3.4)
Management.create(area: 'Consultoría', parent_id: operations.id, grade: 5.6)

#  Department for "Gerencia de tecnología"
#         AVERAGE: 4.05
Management.create(area: 'Desarrollo', parent_id: technology.id, grade: 1.1)
Management.create(area: 'QA', parent_id: technology.id, grade: 7.0)
