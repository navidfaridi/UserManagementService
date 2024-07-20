using Asp.Versioning;
using Microsoft.AspNetCore.Mvc;

namespace Navid.IAM.API.Controllers.v1;

/// <summary>
/// Account Controller
/// </summary>
[Route("api/v{version:apiVersion}/[controller]")]
[ApiVersion("1.0")]
[ApiController]
public class AccountController : ControllerBase
{
    /// <summary>
    /// Generate Random Password 
    /// </summary>
    /// <param name="passwordLength"></param>
    /// <returns></returns>
    [HttpGet("PasswordGenerator/{passwordLength}")]
    [ProducesResponseType(typeof(string), 200)]
    public IActionResult GenerateRandomPassword(int passwordLength = 8)
    {
        var result = Pargoon.Utility.RandomUtils.RandomPassword(passwordLength);
        return Ok(new { password = result });
    }
}
