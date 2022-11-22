// describe('Resume Challenge E2E Test', () => {
//   it('Increments the Visitor Count', () => {
//     cy.visit('https://jcosioresume.com')
//     cy.wait(2000)
//     cy.get('#VisitorCount').then(($VisitorCount) => {
//       const count1 = parseFloat($VisitorCount.text())
//       cy.reload()
//       cy.wait(2000)
//       cy.get('#VisitorCount').then(($VisitorCount) => {
//         const count2 = parseFloat($VisitorCount.text())
//         expect(count2).to.be.greaterThan(count1)
//       })
//     })
//   })
// })

describe('API Test', () => {
    it('Tests the API Response', () => {
        cy.request('POST', 'https://crcapi.jcosioresume.com/CRCResource', {})
       .then((response1) => {
            cy.log(JSON.stringify(response1.body))})
        cy.wait(2000)
        cy.request('POST', 'https://crcapi.jcosioresume.com/CRCResource', {})
        .then((response2) => {
                 cy.log(JSON.stringify(response2.body)).then((response2) => {
                    const count1 = response1.body.ddbResponse.Attributes.VisitorCount
                    const count2 = response2.body.ddbResponse.Attributes.VisitorCount
                     expect(count2).to.be.greaterThan(count1)
                 })})

            
        })
    })    