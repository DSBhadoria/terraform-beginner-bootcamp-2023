/*
package main: This line declares that the current Go source code file belongs to the main package. 
The main package is a special package in Go, and it's used to create standalone executable programs.
*/
package main

/*
import "fmt": This line imports the "fmt" package, which stands for "format." 
The "fmt" package provides functions for formatting input and output in various ways. 
In this program, we use it to print text to the console.
*/
import (
	// "log"
	"fmt"
	// "github/google/uuid"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
)

/*
func main(): This line defines the main function. 
In Go, every executable program must have a main function as its entry point. 
The program execution starts from this function.
*/
func main() {	
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: Provider,
	})

	/*
	fmt.Println("Hello, World!"): This line is the core of the program. 
	It calls the Println function from the "fmt" package to print the text "Hello, World!" followed by a newline character to the standard output (usually the console or terminal).
	*/
    fmt.Println("Hello, World!")
}

func Provider() *schema.Provider {
	var p *schema.Provider
	p = &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{

		},
		DataSourcesMap: map[string]*schema.Resource{

		},
		Schema: map[string]*schema.Schema{
			"endpoint": {
				Type: schema.TypeString,
				Required: true,
				Description: "The endpoint for the external service",
			},
			"token": {
				Type: schema.TypeString,
				Sensitive: true,
				Required: true,
				Description: "Bearer token for authorization",
			},
			"user_uuid": {
				Type: schema.TypeString,				
				Required: true,
				Description: "UUID for configuration",
				// ValidateFunc: validateUUID,
			},
		},
	}
	// p.ConfigureContextFunc = providerConfigure(p)
	return p
}

// func validateUUID(v interface{}, k string) (ws []string, errors []error) {
// 	log.Print("validateUUID:start")
// 	value := v.(string)
// 	if _, err := uuid.Parse(value); err != nil {
// 		errors = append(errors, fmt.Errorf("invalid UUID format"))
// 	}
// 	log.Print("validateUUID:end")
// 	return
// }

