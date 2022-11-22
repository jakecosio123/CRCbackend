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