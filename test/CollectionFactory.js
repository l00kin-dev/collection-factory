const CollectionFactory = artifacts.require("CollectionFactory")

contract("CollectionFactory", (accounts) => {
    before(async () => {
        collectionFactory = await CollectionFactory.deployed()
    })

    it("condition", async () => {
        let id = 1
        assert(id, 1, "Token id should equal to 1")
    })
})