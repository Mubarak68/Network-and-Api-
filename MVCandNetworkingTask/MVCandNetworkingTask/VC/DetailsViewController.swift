//
//  File.swift
//  MVCandNetworkingTask
//
//  Created by Mubarak Aloraifan on 04/03/2024.
//

import UIKit
import SnapKit
import Kingfisher

class DetailsViewController: UIViewController{
    
    var pets: Pet?
    
    private let petNameLabel = UILabel()
    private let petGenderLabel = UILabel()
    private let petAdoptedLabel = UILabel()
    private let petAgeLabel = UILabel()
    private let petIDLabel = UILabel()
    private let petImageLabel = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        configureWithPet()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        petNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        petAdoptedLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        view.addSubview(petNameLabel)
        view.addSubview(petGenderLabel)
        view.addSubview(petAdoptedLabel)
        view.addSubview(petAgeLabel)
        view.addSubview(petIDLabel)
        view.addSubview(petImageLabel)
    }
    
    private func setupLayout() {
        petImageLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)  // Example size, adjust as needed
        }
        
        petNameLabel.snp.makeConstraints { make in
            make.top.equalTo(petIDLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        petAdoptedLabel.snp.makeConstraints { make in
            make.top.equalTo(petNameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        petAgeLabel.snp.makeConstraints { make in
            make.top.equalTo(petAdoptedLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        petIDLabel.snp.makeConstraints { make in
            make.top.equalTo(petImageLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        petGenderLabel.snp.makeConstraints { make in
            make.top.equalTo(petAgeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureWithPet() {
        petIDLabel.text = "Pet's ID: \(pets?.id ?? 0)"
        petAgeLabel.text = "Age: \(pets?.age ?? 0)"
        petNameLabel.text = "Pet Name: \(pets?.name ?? "N/A")"
        petGenderLabel.text = "Pet's Gender: \(pets?.gender ?? "N/A")"
        petAdoptedLabel.text = "Is Adopted? \(pets?.adopted ?? false)"
        petImageLabel.kf.setImage(with: URL (string: "\(pets?.image ?? "N/A")"))
        petImageLabel.layer.cornerRadius = 20
    }
}
