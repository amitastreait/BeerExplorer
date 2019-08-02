describe("Lightning Component Testing Examples", function () {
    afterEach(function () {
        $T.clearRenderedTestComponents();
    });
    
    describe("A suite that tests the obvious", function() {
        it("spec that verifies that true is true", function() {
            expect(true).toBe(true);
        });
    });
});

describe('c:helloWorld', function () {
    it('verify component rendering', function (done) {
        $T.createComponent('c:helloWorld', {}, true)
            .then(function(cmp) {
                expect(cmp.find("message").getElement().innerHTML).toBe('Hello World!');
                done();
            }).catch(function (e) {
                done.fail(e);
            });
    });
});

afterEach(function () {
    $T.clearRenderedTestComponents();
});