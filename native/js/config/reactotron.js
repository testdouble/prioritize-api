import Reactotron from 'reactotron-react-native';
import { reactotronRedux } from 'reactotron-redux';

if(__DEV__) {
  Reactotron
    .configure({name: "Prioritize"})
    .use(reactotronRedux())
    .connect()
  ;

  Reactotron.clear();
}
