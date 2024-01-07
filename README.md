
# Cryptocurrencies

I was trying to make an app to get the current values of cryptocurrencies. I tried to try out requests to the network in practice, creating a manager to handle all requests to the network using Singleton.


## 🛠 Skills
- Alamofire
- Singleton
- API
- GCD
- Error handling



## API Reference

#### Get all items

```http
  GET /rest.coinapi.io/v1/assets
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Items data

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `name`    | `string` | Gets or sets the name of the asset |
|`price_usd`| `double` | Gets or sets the USD price of the asset. |

## Screenshots

<p align="center">
  <img src="https://github.com/EvgeniMityulya/Cryptocurrencies/assets/90418758/051ab8b9-6e03-4f32-9b10-ab59163d92d4" width="300">
</p>

