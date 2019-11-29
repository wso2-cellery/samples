//   Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.


// Composite file for Hello world Sample
import ballerina/config;
import celleryio/cellery;

public function build(cellery:ImageName iName) returns error? {
    // Hello Component
    // This Components exposes the HTML hello world page
    cellery:Component helloComponent = {
        name: "hello",
        src: {
            image: "wso2cellery/samples-hello-world-webapp:latest-dev"
        },
        ingresses: {
            webUI: <cellery:HttpPortIngress>{
                port: 80
            }
        },
        envVars: {
            HELLO_NAME: { value: "Cellery" }
        }
    };

    // Composite Initialization
    cellery:Composite helloComposite = {
        components: {
            helloComp: helloComponent
        }
    };
    return <@untainted> cellery:createImage(helloComposite,  iName);
}

public function run(cellery:ImageName iName, map<cellery:ImageName> instances, boolean startDependencies,
                    boolean shareDependencies) returns (cellery:InstanceState[]|error?) {
    cellery:CellImage|cellery:Composite helloComposite = cellery:constructImage(iName);
    string helloName = config:getAsString("HELLO_NAME");
    if (helloName !== "") {
        helloComposite.components["helloComp"]["envVars"]["HELLO_NAME"].value = helloName;
    }
    return <@untainted> cellery:createInstance(helloComposite, iName, instances, startDependencies, shareDependencies);
}
