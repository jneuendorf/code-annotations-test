module.exports =

    activate: (state) ->
        return @

    deactivate: () ->
        return @

    serialize: () ->
        return {}

    provideRenderer: () ->
        class TestRenderer
            @getName: () ->
                return "TestRenderer"
            @fileExtension: "test"
            @isTextBased: true
            @description: "Render plain text (for testing purposes)"

            _render: (codeAnnotationManager, clearCache) ->
                pre = document.createElement("pre")
                pre.innerHTML = @asset.readSync(clearCache).replace(/>/g, "&gt;")
                    .replace(/</g, "&lt;")
                    .replace(/"/g, "&quot;")
                return pre
        return TestRenderer
