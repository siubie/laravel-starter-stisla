describe('Tes Reset Database', () => {
    before(() => {
       cy.exec('psql -U devpostgre -d laravel -f ./cypress/fixtures/laravel.sql')
    //    cy.exec('psql -U devpostgre -d laravel -f ./cypress/fixtures/laravel.sql') 
    });
    it('Login dan Delete User Soko', () => {
        cy.visit('/')
        cy.get(':nth-child(2) > .form-control').type('superadmin@gmail.com')
        cy.get(':nth-child(3) > .form-control').type('password')
        cy.get('.btn').click()
        cy.get('.form-inline > .navbar-nav > :nth-child(1) > .nav-link').click()
        cy.contains('Role Management').click()
        cy.contains('Role List').click()
        cy.url().should('include', '/role-and-permission/role')
        cy.contains('Soko').next().next().children(".d-flex").find('.btn-danger').click()
        cy.get('.alert').should('have.class', 'alert-success')
    });
});