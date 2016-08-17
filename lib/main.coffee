module.exports = class Main

    activate: (state) ->
        console.log "activating test"
        return @

    deactivate: () ->
        console.log "deactivating test"
        return @

    serialize: () ->
        return {}

    consumeAssetRendererClass: (AssetRenderer) ->
        console.log "consuming asset renderer"
        @AssetRenderer = AssetRenderer
        return @

    provideRenderer: () ->
        console.log "providing renderer"
        if not AssetRenderer?
            throw new Error("No super class found.")
        class TestRenderer extends @AssetRenderer
            @parent: AssetRenderer
            @fileExtension: ["png", "gif", "jpg", "jpeg", "bmp"]
            @isTextBased: false
            @description: "Render images as &lt;img&gt; tags (currently supports png, gif, jpg, jpeg and bmp)"

            _render: (codeAnnotationManager) ->
                img = document.createElement("img")
                img.src = @asset.getPath()
                return img
        return TestRenderer
