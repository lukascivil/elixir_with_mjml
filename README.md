# ElixirWithMjml

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

![alt tag](http://lukascivil.com.br/githubimages/elixir_with_mjml/diagram.png)

```html
<mjml>
  <mj-body>
    <mj-section>
      <mj-column>
        <mj-text font-size="20px" color="#F45E43" font-family="helvetica">Elixir with mjml</mj-text>
      </mj-column>
    </mj-section>
  </mj-body>
</mjml>
```

Post : localhost:4000/api/mjml
```json
{
 "minify": false,
 "mjml": "<mjml>...</mjml>"
}
```

Response :
```json
{
 "html": "<!DOCTYPE HTML><html>...</html>",
 "errors": []
}
```
