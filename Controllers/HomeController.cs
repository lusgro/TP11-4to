using Microsoft.AspNetCore.Mvc;
using SpotifyAPI.Web;

namespace TP11.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        Main().Wait();
        return View();
    }

    static async Task Main()
    {
        var config = SpotifyClientConfig.CreateDefault();

        var request = new ClientCredentialsRequest("7b5afc5ef1744921b98041719f50d5a1", "de94ef49b7674ab59a1de9ba6db84900");
        var response = await new OAuthClient(config).RequestToken(request);

        var spotify = new SpotifyClient(config.WithToken(response.AccessToken));

        var track = await spotify.Tracks.Get("05mDaV9Vb3wrzjF6OPZnhq");
        Console.WriteLine(track.Name);
    }
}
