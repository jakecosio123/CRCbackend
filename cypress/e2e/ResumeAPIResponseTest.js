/// <reference types="cypress" />

describe('API Test', () => {
    it('Tests the API Response', () => {
        cy.request('POST', 'https://crcapi.jcosioresume.com/CRCResource', {})
       .should((response) => {
            cy.log(JSON.stringify(response.body))
            cy.expect(response.status).to.eq(200)
            cy.expect(response.body.ddbResponse.Attributes).to.have.key('VisitorCount')
            cy.expect(response.body.ddbResponse.Attributes.VisitorCount).to.be.a('number')
        })
    })
})  