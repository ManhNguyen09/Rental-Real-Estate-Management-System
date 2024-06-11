package com.javaweb.controller.admin;
import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.CustomerConverter;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.CustomerCreateRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Transactional
@RestController(value = "customersControllerOfAdmin")
public class CustomerController {
    @Autowired
    private IUserService userService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView getNews(@ModelAttribute CustomerSearchRequest customerSearchRequest,
                                @RequestParam Map<String, Object> conditions,
                                @ModelAttribute(SystemConstant.MODEL) UserDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            conditions.put("staffId", staffId);
        }
        List<CustomerDTO> customerDTOS = customerService.findAll(conditions);
        model.setMaxPageItems(5);
        model.setTotalItem(customerDTOS.size());
        mav.addObject("customerList", customerDTOS);
        mav.addObject("modelSearch", customerSearchRequest);
        mav.addObject("staffs", userService.getStaffs());
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView customerAddForm(@ModelAttribute CustomerCreateRequest customerCreateRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("statuses", Status.type());
        mav.addObject("TransactionList", TransactionType.transactionType());
        mav.addObject("customerCreateRequest", customerCreateRequest);
        return mav;
    }
    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView customerEditForm(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerCreateRequest customerCreateRequest = customerService.findOneById(id);
        mav.addObject("statuses", Status.type());
        mav.addObject("TransactionList", TransactionType.transactionType());
        mav.addObject("customerCreateRequest", customerCreateRequest);
        List<TransactionDTO> CSKH = transactionService.findAllByCodeAndCustomer("CSKH", id);
        List<TransactionDTO> DDX = transactionService.findAllByCodeAndCustomer("DDX", id);
        mav.addObject("CSKH", CSKH);
        mav.addObject("DDX", DDX);
        return mav;
    }
}
