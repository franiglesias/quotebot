import {AutomaticQuoteBot} from "./AutomaticQuoteBot"


export class Application {

    static main(_args: string[] = []) {
        const bot = new AutomaticQuoteBot()
        bot.sendAllQuotes("FAST")
    }
}
